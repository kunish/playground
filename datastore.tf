data "vsphere_datastore" "datastore" {
  name = "esxi"

  datacenter_id = vsphere_datacenter.datacenter.moid

  depends_on = [
    vsphere_host.box
  ]
}
