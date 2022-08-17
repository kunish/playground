data "vsphere_resource_pool" "pool" {
  name = "box.kuin.sh/Resources"

  datacenter_id = vsphere_datacenter.datacenter.moid

  depends_on = [
    vsphere_host.box
  ]
}
