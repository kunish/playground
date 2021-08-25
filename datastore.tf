data "vsphere_datastore" "datastore" {
  name = "esxi"

  datacenter_id = vsphere_datacenter.datacenter.moid

  depends_on = [
    vsphere_host.emc
  ]
}

data "vsphere_datastore" "nuc" {
  name = "nuc"

  datacenter_id = vsphere_datacenter.datacenter.moid

  depends_on = [
    vsphere_host.nuc
  ]
}
