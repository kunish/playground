variable "vms" {
  type = list(string)
}

variable "folder" {
  type = string
}

variable "resource_pool_id" {
  type = string
}

variable "datastore_id" {
  type = string
}

variable "template_uuid" {
  type = string
}

variable "num_cpus" {
  type = number
}

variable "memory" {
  type = number
}

variable "guest_id" {
  type = string
}

variable "network_id" {
  type = string
}

variable "disk_size" {
  type = number
}

variable "ignition_config_url" {
  type = string
}
