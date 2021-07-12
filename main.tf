provider "vsphere" {
  user           = var.vsphere_user
  password       = var.vsphere_password
  vsphere_server = var.vsphere_server

  allow_unverified_ssl = true
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

data "vsphere_content_library" "library" {
  name = var.vsphere_content_library_name
}

data "vsphere_content_library_item" "item" {
  name       = var.vm_content_library_template_name
  type       = "vapp"
  library_id = data.vsphere_content_library.library.id
}

locals {
  vms = {
    gateway = {
      mac_address = "20:a7:8e:3c:78:c2"
    }
    clash = {
      mac_address = "00:50:56:97:8a:30"
    }
    workstation = {
      mac_address = "00:0c:29:27:41:47"
    }
    jarvy-workstation = {
      mac_address = "00:50:56:82:3c:5e"
    }
  }
}

resource "vsphere_virtual_machine" "vm" {
  for_each         = var.vms
  name             = each.key
  folder           = var.vm_folder
  resource_pool_id = data.vsphere_resource_pool.pool.id
  datastore_id     = data.vsphere_datastore.datastore.id

  # equivalent to disk.EnableUUID
  enable_disk_uuid = true

  guest_id = var.vm_guest_id
  num_cpus = var.vm_num_cpus
  memory   = var.vm_memory

  network_interface {
    network_id  = data.vsphere_network.network.id
    mac_address = each.value.mac_address
  }

  # required for vapp configuration
  cdrom {
    client_device = true
  }

  disk {
    label = "disk0"
    size  = var.vm_disk_size
  }

  clone {
    template_uuid = data.vsphere_content_library_item.item.id
  }

  vapp {
    properties = {
      "hostname" : each.key
      "instance-id" : each.key
      "public-keys" : var.vm_ssh_public_keys
      "user-data" : base64encode(file(var.vm_user_data_file_path))
    }
  }
}
