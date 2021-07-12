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

variable "vsphere_content_library_name" {
  type = string
}

variable "vsphere_datastore" {
  type = string
}

variable "vm_network" {
  type = string
}

variable "vm_content_library_template_name" {
  type = string
}

variable "vm_guest_id" {
  type = string
}

variable "vms" {
  type = map(object({
    mac_address = string
  }))
}

variable "vm_folder" {
  type = string
}

variable "vm_num_cpus" {
  type = number
}

variable "vm_memory" {
  type = number
}

variable "vm_disk_size" {
  type = number
}

variable "vm_ssh_public_keys" {
  type      = string
  sensitive = true
}

variable "vm_user_data_file_path" {
  type = string
}
