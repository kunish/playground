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

variable "vsphere_datacenter_name" {
  type = string
}

variable "vsphere_resource_pool_host" {
  type      = string
  sensitive = true
}

variable "vsphere_datastore" {
  type = string
}

variable "vm_network" {
  type = string
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
