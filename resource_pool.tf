data "vsphere_resource_pool" "emc_pool" {
  name = "esxi.kuin.sh/Resources"

  datacenter_id = vsphere_datacenter.datacenter.moid
}
