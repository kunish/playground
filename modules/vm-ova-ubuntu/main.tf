data "terraform_remote_state" "router" {
  backend = "remote"

  config = {
    organization = "kunish"
    workspaces = {
      name = "router"
    }
  }
}

resource "vsphere_virtual_machine" "vm" {
  for_each         = toset(var.vms)
  name             = each.key
  folder           = var.folder
  resource_pool_id = var.resource_pool_id
  datastore_id     = var.datastore_id

  enable_disk_uuid = true

  guest_id = var.guest_id
  num_cpus = var.num_cpus
  memory   = var.memory

  wait_for_guest_net_timeout = 0

  network_interface {
    network_id     = var.network_id
    use_static_mac = true
    mac_address    = lower(data.terraform_remote_state.router.outputs.leases[each.key].macaddress)
  }

  # required for cloud-init
  cdrom {
    client_device = true
  }

  disk {
    label = "disk0"
    size  = var.disk_size
  }

  clone {
    template_uuid = var.template_uuid
  }

  vapp {
    properties = {
      "hostname" : each.key
      "instance-id" : each.key
      "seedfrom" : var.vapp_seedfrom
    }
  }
}

output "vms" {
  value = vsphere_virtual_machine.vm
}
