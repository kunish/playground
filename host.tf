resource "vsphere_host" "emc" {
  hostname = "esxi.kuin.sh"
  username = var.esxi_username
  password = var.esxi_password

  datacenter = vsphere_datacenter.datacenter.moid

  lifecycle {
    prevent_destroy = true
  }
}

resource "vsphere_host" "nuc" {
  hostname = "nuc.kuin.sh"
  username = var.esxi_username
  password = var.esxi_password

  datacenter = vsphere_datacenter.datacenter.moid

  lifecycle {
    prevent_destroy = true
  }
}
