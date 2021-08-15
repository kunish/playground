variable "vsphere_user" {
  type      = string
  sensitive = true
}

variable "vsphere_password" {
  type      = string
  sensitive = true
}

variable "vsphere_server" {
  type      = string
  sensitive = true
}

variable "esxi_username" {
  type      = string
  sensitive = true
}

variable "esxi_password" {
  type      = string
  sensitive = true
}

variable "vsphere_content_library_name" {
  type = string
}

variable "vm_content_library_template_name" {
  type = string
}

variable "vm_content_library_template_url" {
  type = string
}

variable "vm_guest_id" {
  type = string
}
