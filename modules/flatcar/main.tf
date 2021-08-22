resource "vsphere_virtual_machine" "flatcar" {
  for_each         = toset(var.vms)
  name             = each.key
  folder           = var.folder
  resource_pool_id = var.resource_pool_id
  datastore_id     = var.datastore_id

  # equivalent to disk.EnableUUID
  enable_disk_uuid = true

  guest_id = "other5xLinux64Guest"
  num_cpus = var.num_cpus
  memory   = var.memory

  # https://kb.vmware.com/s/article/2007240
  # esxi 7.0U2
  hardware_version = 19

  wait_for_guest_net_timeout = 0

  network_interface {
    network_id = var.network_id
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
      "guestinfo.ignition.config.url" : "http://pi2.kuin.sh/flatcar/ignition.json",
      "guestinfo.interface.0.dhcp" : "yes",
    }
  }
}
