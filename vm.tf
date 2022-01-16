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

module "vm_cluster_controlplane_staging" {
  source = "./modules/vm-ova-ubuntu"

  folder           = "production"
  resource_pool_id = data.vsphere_resource_pool.emc_pool.id
  datastore_id     = data.vsphere_datastore.datastore.id
  template_uuid    = vsphere_content_library_item.ubuntu.id
  guest_id         = "ubuntu64Guest"
  num_cpus         = 4
  memory           = 2048
  network_id       = vsphere_distributed_port_group.dpg.id
  disk_size        = 16
  vapp_seedfrom    = "http://pi1.kuin.sh/homelab/"

  vms = ["cluster-controlplane"]
}

module "vm_cluster_worker_staging" {
  source = "./modules/vm-ova-ubuntu"

  folder           = "production"
  resource_pool_id = data.vsphere_resource_pool.emc_pool.id
  datastore_id     = data.vsphere_datastore.datastore.id
  template_uuid    = vsphere_content_library_item.ubuntu.id
  guest_id         = "ubuntu64Guest"
  num_cpus         = 4
  memory           = 8192
  network_id       = vsphere_distributed_port_group.dpg.id
  disk_size        = 32
  vapp_seedfrom    = "http://pi1.kuin.sh/homelab/"

  vms = ["cluster-worker-1", "cluster-worker-2", "cluster-worker-3"]
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
