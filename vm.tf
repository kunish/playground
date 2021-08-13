locals {
  vms = {
    "speedtest" = {
      folder        = "staging"
      num_cpus      = 4
      memory        = 4096
      disk_size     = 64
      vapp_seedfrom = "http://pi2.kuin.sh/homelab/"
    }
    "cluster-proxy" = {
      folder        = "cluster"
      num_cpus      = 2
      memory        = 1024
      disk_size     = 32
      vapp_seedfrom = "http://pi2.kuin.sh/homelab/"
    }
    "cluster-controlplane-1" = {
      folder        = "cluster"
      num_cpus      = 4
      memory        = 4096
      disk_size     = 64
      vapp_seedfrom = "http://pi2.kuin.sh/homelab/"
    }
    "cluster-controlplane-2" = {
      folder        = "cluster"
      num_cpus      = 4
      memory        = 4096
      disk_size     = 64
      vapp_seedfrom = "http://pi2.kuin.sh/homelab/"
    }
    "cluster-controlplane-3" = {
      folder        = "cluster"
      num_cpus      = 4
      memory        = 4096
      disk_size     = 64
      vapp_seedfrom = "http://pi2.kuin.sh/homelab/"
    }
    "cluster-worker-1" = {
      folder        = "cluster"
      num_cpus      = 8
      memory        = 8192
      disk_size     = 64
      vapp_seedfrom = "http://pi2.kuin.sh/homelab/"
    }
    "cluster-worker-2" = {
      folder        = "cluster"
      num_cpus      = 8
      memory        = 8192
      disk_size     = 64
      vapp_seedfrom = "http://pi2.kuin.sh/homelab/"
    }
    "cluster-worker-3" = {
      folder        = "cluster"
      num_cpus      = 8
      memory        = 8192
      disk_size     = 64
      vapp_seedfrom = "http://pi2.kuin.sh/homelab/"
    }
    "cluster-worker-4" = {
      folder        = "cluster"
      num_cpus      = 8
      memory        = 8192
      disk_size     = 64
      vapp_seedfrom = "http://pi2.kuin.sh/homelab/"
    }
    "cluster-worker-5" = {
      folder        = "cluster"
      num_cpus      = 8
      memory        = 8192
      disk_size     = 64
      vapp_seedfrom = "http://pi2.kuin.sh/homelab/"
    }
  }
}

resource "vsphere_virtual_machine" "vms" {
  for_each         = local.vms
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

  wait_for_guest_net_timeout = 0

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
