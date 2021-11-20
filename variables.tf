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

variable "pm_api_url" {
  type      = string
  sensitive = true
}

variable "pm_user" {
  type      = string
  sensitive = true
}

variable "pm_password" {
  type      = string
  sensitive = true
}
