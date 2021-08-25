resource "vsphere_distributed_virtual_switch" "dvs" {
  name          = "dvs"
  datacenter_id = vsphere_datacenter.datacenter.moid

  host {
    host_system_id = vsphere_host.emc.id
    devices        = ["vmnic2", "vmnic3", "vmnic4", "vmnic5"]
  }

  depends_on = [
    vsphere_host.emc,
  ]
}

resource "vsphere_distributed_port_group" "dpg" {
  name                            = "dpg"
  distributed_virtual_switch_uuid = vsphere_distributed_virtual_switch.dvs.id
}

data "vsphere_network" "nic" {
  name          = "VM Network"
  datacenter_id = vsphere_datacenter.datacenter.moid
}
