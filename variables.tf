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

variable "vsphere_folders" {
  type = list(string)
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

variable "vms" {
  type = map(object({
    folder        = string
    num_cpus      = number
    memory        = number
    disk_size     = number
    vapp_seedfrom = string
  }))
}
