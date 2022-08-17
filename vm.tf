module "vm_cluster_controlplane_staging" {
  source = "./modules/vm-ova-ubuntu"

  folder           = "production"
  resource_pool_id = data.vsphere_resource_pool.pool.id
  datastore_id     = data.vsphere_datastore.datastore.id
  template_uuid    = vsphere_content_library_item.ubuntu.id
  guest_id         = "ubuntu64Guest"
  num_cpus         = 4
  memory           = 4096
  network_id       = data.vsphere_network.nic.id
  disk_size        = 16
  vapp_seedfrom    = "http://pi4.kuin.sh/homelab/"

  vms = ["master"]
}

module "vm_cluster_worker_staging" {
  source = "./modules/vm-ova-ubuntu"

  folder           = "production"
  resource_pool_id = data.vsphere_resource_pool.pool.id
  datastore_id     = data.vsphere_datastore.datastore.id
  template_uuid    = vsphere_content_library_item.ubuntu.id
  guest_id         = "ubuntu64Guest"
  num_cpus         = 4
  memory           = 8192
  network_id       = data.vsphere_network.nic.id
  disk_size        = 32
  vapp_seedfrom    = "http://pi4.kuin.sh/homelab/"

  vms = ["node-01", "node-02", "node-03"]
}
