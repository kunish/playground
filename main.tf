terraform {
  required_providers {
    vsphere = {
      source = "hashicorp/vsphere"
    }
  }

  backend "remote" {
    organization = "kunish"
    workspaces {
      name = "playground"
    }
  }
}

provider "vsphere" {
  user           = var.vsphere_user
  password       = var.vsphere_password
  vsphere_server = var.vsphere_server

  allow_unverified_ssl = true
}
