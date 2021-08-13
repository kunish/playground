vsphere_datacenter_name      = "Datacenter"
vsphere_resource_pool_host   = "esxi.kuin.sh"
vsphere_content_library_name = "main"
vsphere_datastore            = "esxi"
vsphere_folders              = ["cluster"]

vm_guest_id                      = "ubuntu64Guest"
vm_content_library_template_name = "focal-server-cloudimg-amd64"
vm_content_library_template_url  = "https://mirrors.tuna.tsinghua.edu.cn/ubuntu-cloud-images/focal/current/focal-server-cloudimg-amd64.ova"
vm_network                       = "VM Network"

vms = {
  "speedtest" = {
    folder        = "staging"
    num_cpus      = 4
    memory        = 4096
    disk_size     = 64
    vapp_seedfrom = "http://pi2.kuin.sh/homelab/"
  }
  "cluster-proxy" = {
    folder        = "cluster"
    num_cpus      = 2
    memory        = 1024
    disk_size     = 32
    vapp_seedfrom = "http://pi2.kuin.sh/homelab/"
  }
  "cluster-controlplane-1" = {
    folder        = "cluster"
    num_cpus      = 4
    memory        = 4096
    disk_size     = 64
    vapp_seedfrom = "http://pi2.kuin.sh/homelab/"
  }
  "cluster-controlplane-2" = {
    folder        = "cluster"
    num_cpus      = 4
    memory        = 4096
    disk_size     = 64
    vapp_seedfrom = "http://pi2.kuin.sh/homelab/"
  }
  "cluster-controlplane-3" = {
    folder        = "cluster"
    num_cpus      = 4
    memory        = 4096
    disk_size     = 64
    vapp_seedfrom = "http://pi2.kuin.sh/homelab/"
  }
  "cluster-worker-1" = {
    folder        = "cluster"
    num_cpus      = 8
    memory        = 8192
    disk_size     = 64
    vapp_seedfrom = "http://pi2.kuin.sh/homelab/"
  }
  "cluster-worker-2" = {
    folder        = "cluster"
    num_cpus      = 8
    memory        = 8192
    disk_size     = 64
    vapp_seedfrom = "http://pi2.kuin.sh/homelab/"
  }
  "cluster-worker-3" = {
    folder        = "cluster"
    num_cpus      = 8
    memory        = 8192
    disk_size     = 64
    vapp_seedfrom = "http://pi2.kuin.sh/homelab/"
  }
  "cluster-worker-4" = {
    folder        = "cluster"
    num_cpus      = 8
    memory        = 8192
    disk_size     = 64
    vapp_seedfrom = "http://pi2.kuin.sh/homelab/"
  }
  "cluster-worker-5" = {
    folder        = "cluster"
    num_cpus      = 8
    memory        = 8192
    disk_size     = 64
    vapp_seedfrom = "http://pi2.kuin.sh/homelab/"
  }
}
