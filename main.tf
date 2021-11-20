terraform {
  required_providers {
    vsphere = {
      source = "hashicorp/vsphere"
    }
    proxmox = {
      source = "Telmate/proxmox"
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
  vsphere_server       = var.vsphere_server
  user                 = var.vsphere_user
  password             = var.vsphere_password
  allow_unverified_ssl = true
}

provider "proxmox" {
  pm_api_url      = var.pm_api_url
  pm_user         = var.pm_user
  pm_password     = var.pm_password
  pm_tls_insecure = true
}
