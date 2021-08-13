locals {
  folders = ["cluster"]
}

resource "vsphere_folder" "folders" {
  for_each      = toset(local.folders)
  type          = "vm"
  path          = each.key
  datacenter_id = data.vsphere_datacenter.datacenter.id
}
