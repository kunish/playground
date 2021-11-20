module "vm_jarvy" {
  source = "./modules/vm-ova-ubuntu"

  folder           = "production"
  resource_pool_id = data.vsphere_resource_pool.emc_pool.id
  datastore_id     = data.vsphere_datastore.datastore.id
  template_uuid    = vsphere_content_library_item.ubuntu.id
  guest_id         = "ubuntu64Guest"
  num_cpus         = 4
  memory           = 4096
  network_id       = vsphere_distributed_port_group.dpg.id
  disk_size        = 64
  vapp_seedfrom    = "http://pi1.kuin.sh/jarvy/"

  vms = ["jarvy-workstation"]
}

module "vm_cluster_proxy" {
  source = "./modules/vm-ova-ubuntu"

  folder           = null
  resource_pool_id = vsphere_vapp_container.cluster.id
  datastore_id     = data.vsphere_datastore.datastore.id
  template_uuid    = vsphere_content_library_item.ubuntu.id
  guest_id         = "ubuntu64Guest"
  num_cpus         = 1
  memory           = 1024
  network_id       = vsphere_distributed_port_group.dpg.id
  disk_size        = 32
  vapp_seedfrom    = "http://pi1.kuin.sh/homelab/"

  vms = ["cluster-proxy"]
}

module "vm_cluster_controlplane" {
  source = "./modules/vm-ova-ubuntu"

  folder           = null
  resource_pool_id = vsphere_vapp_container.cluster.id
  datastore_id     = data.vsphere_datastore.datastore.id
  template_uuid    = vsphere_content_library_item.ubuntu.id
  guest_id         = "ubuntu64Guest"
  num_cpus         = 4
  memory           = 4096
  network_id       = vsphere_distributed_port_group.dpg.id
  disk_size        = 64
  vapp_seedfrom    = "http://pi1.kuin.sh/homelab/"

  vms = ["cluster-controlplane-1", "cluster-controlplane-2", "cluster-controlplane-3"]
}

module "vm_cluster_worker" {
  source = "./modules/vm-ova-ubuntu"

  folder           = null
  resource_pool_id = vsphere_vapp_container.cluster.id
  datastore_id     = data.vsphere_datastore.datastore.id
  template_uuid    = vsphere_content_library_item.ubuntu.id
  guest_id         = "ubuntu64Guest"
  num_cpus         = 8
  memory           = 8192
  network_id       = vsphere_distributed_port_group.dpg.id
  disk_size        = 128
  vapp_seedfrom    = "http://pi1.kuin.sh/homelab/"

  vms = ["cluster-worker-1", "cluster-worker-2", "cluster-worker-3", "cluster-worker-4", "cluster-worker-5"]
}

module "vm_cluster_controlplane_staging" {
  source = "./modules/vm-ova-ubuntu"

  folder           = "staging"
  resource_pool_id = data.vsphere_resource_pool.emc_pool.id
  datastore_id     = data.vsphere_datastore.datastore.id
  template_uuid    = vsphere_content_library_item.ubuntu.id
  guest_id         = "ubuntu64Guest"
  num_cpus         = 1
  memory           = 2048
  network_id       = vsphere_distributed_port_group.dpg.id
  disk_size        = 16
  vapp_seedfrom    = "http://pi1.kuin.sh/homelab/"

  vms = ["cluster-controlplane-staging"]
}

module "vm_cluster_worker_staging" {
  source = "./modules/vm-ova-ubuntu"

  folder           = "staging"
  resource_pool_id = data.vsphere_resource_pool.emc_pool.id
  datastore_id     = data.vsphere_datastore.datastore.id
  template_uuid    = vsphere_content_library_item.ubuntu.id
  guest_id         = "ubuntu64Guest"
  num_cpus         = 2
  memory           = 4096
  network_id       = vsphere_distributed_port_group.dpg.id
  disk_size        = 32
  vapp_seedfrom    = "http://pi1.kuin.sh/homelab/"

  vms = ["cluster-worker-1-staging", "cluster-worker-2-staging", "cluster-worker-3-staging"]
}

module "vm_ci" {
  source = "./modules/vm-ova-ubuntu"

  folder           = "production"
  resource_pool_id = data.vsphere_resource_pool.emc_pool.id
  datastore_id     = data.vsphere_datastore.datastore.id
  template_uuid    = vsphere_content_library_item.ubuntu.id
  guest_id         = "ubuntu64Guest"
  num_cpus         = 8
  memory           = 8192
  network_id       = vsphere_distributed_port_group.dpg.id
  disk_size        = 128
  vapp_seedfrom    = "http://pi1.kuin.sh/homelab/"

  vms = ["gitlab-runner"]
}

resource "proxmox_lxc" "alpine" {
  target_node  = "pve"
  hostname     = "alpine-pve"
  ostemplate   = "local:vztmpl/alpine-3.14-default_20210623_amd64.tar.xz"
  password     = "alpine"
  unprivileged = true

  rootfs {
    storage = "local-lvm"
    size    = "8G"
  }

  network {
    name   = "eth0"
    bridge = "vmbr0"
    ip     = "dhcp"
  }
}
