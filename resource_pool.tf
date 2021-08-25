data "vsphere_resource_pool" "emc_pool" {
  name = "esxi.kuin.sh/Resources"

  datacenter_id = vsphere_datacenter.datacenter.moid

  depends_on = [
    vsphere_host.emc
  ]
}

data "vsphere_resource_pool" "nuc_pool" {
  name = "nuc.kuin.sh/Resources"

  datacenter_id = vsphere_datacenter.datacenter.moid

  depends_on = [
    vsphere_host.nuc
  ]
}
