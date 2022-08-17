resource "vsphere_host" "box" {
  hostname   = "box.kuin.sh"
  username   = var.esxi_username
  password   = var.esxi_password
  thumbprint = "5A:1C:A9:5B:C7:E0:DF:72:17:09:42:CA:41:45:69:C3:7F:0A:16:C3"

  datacenter = vsphere_datacenter.datacenter.moid

  lifecycle {
    prevent_destroy = true
  }
}
