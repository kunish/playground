terraform {
  required_providers {
    vsphere = {
      source = "hashicorp/vsphere"
    }
  }

  backend "remote" {
    organization = "kunish"
    workspaces {
      name = "playground"
    }
  }
}

provider "vsphere" {
  user           = var.vsphere_user
  password       = var.vsphere_password
  vsphere_server = var.vsphere_server

  allow_unverified_ssl = true
}

data "terraform_remote_state" "router" {
  backend = "remote"

  config = {
    organization = "kunish"
    workspaces = {
      name = "router"
    }
  }
}

data "vsphere_datacenter" "datacenter" {
  name = var.vsphere_datacenter_name
}

data "vsphere_datastore" "datastore" {
  name          = var.vsphere_datastore
  datacenter_id = data.vsphere_datacenter.datacenter.id
}

data "vsphere_resource_pool" "pool" {
  name          = "${var.vsphere_resource_pool_host}/Resources"
  datacenter_id = data.vsphere_datacenter.datacenter.id
}

data "vsphere_network" "network" {
  name          = var.vm_network
  datacenter_id = data.vsphere_datacenter.datacenter.id
}

resource "vsphere_folder" "folders" {
  for_each      = toset(var.vsphere_folders)
  type          = "vm"
  path          = each.key
  datacenter_id = data.vsphere_datacenter.datacenter.id
}

resource "vsphere_content_library" "library" {
  name = var.vsphere_content_library_name
  publication {
    published = true
  }
  storage_backing = [data.vsphere_datastore.datastore.id]
}

resource "vsphere_content_library_item" "template" {
  name       = var.vm_content_library_template_name
  file_url   = var.vm_content_library_template_url
  library_id = vsphere_content_library.library.id
}

resource "vsphere_virtual_machine" "vm" {
  for_each         = var.vms
  name             = each.key
  folder           = each.value.folder
  resource_pool_id = data.vsphere_resource_pool.pool.id
  datastore_id     = data.vsphere_datastore.datastore.id

  # equivalent to disk.EnableUUID
  enable_disk_uuid = true

  guest_id = var.vm_guest_id
  num_cpus = each.value.num_cpus
  memory   = each.value.memory

  # https://kb.vmware.com/s/article/2007240
  # esxi 7.0U2
  hardware_version = 19

  network_interface {
    network_id     = data.vsphere_network.network.id
    use_static_mac = true
    mac_address    = lower(data.terraform_remote_state.router.outputs.leases[each.key].macaddress)
  }

  # required for cloud-init
  cdrom {
    client_device = true
  }

  disk {
    label = "disk0"
    size  = each.value.disk_size
  }

  clone {
    template_uuid = vsphere_content_library_item.template.id
  }

  vapp {
    properties = {
      "hostname" : each.key
      "instance-id" : each.key
      "seedfrom" : each.value.vapp_seedfrom
    }
  }
}
