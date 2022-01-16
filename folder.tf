locals {
  folders = ["staging", "production"]
}

resource "vsphere_folder" "folders" {
  for_each      = toset(local.folders)
  type          = "vm"
  path          = each.key
  datacenter_id = vsphere_datacenter.datacenter.moid
}
