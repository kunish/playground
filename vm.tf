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
  vapp_seedfrom    = "http://pi2.kuin.sh/jarvy/"

  vms = ["jarvy-workstation"]
}

module "vm_mini" {
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
  vapp_seedfrom    = "http://pi2.kuin.sh/homelab/"

  vms = ["gateway", "speedtest", "clash"]
}

module "vm_large" {
  source = "./modules/vm-ova-ubuntu"

  folder           = "production"
  resource_pool_id = data.vsphere_resource_pool.emc_pool.id
  datastore_id     = data.vsphere_datastore.datastore.id
  template_uuid    = vsphere_content_library_item.ubuntu.id
  guest_id         = "ubuntu64Guest"
  num_cpus         = 16
  memory           = 16384
  network_id       = vsphere_distributed_port_group.dpg.id
  disk_size        = 128
  vapp_seedfrom    = "http://pi2.kuin.sh/homelab/"

  vms = ["workstation"]
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
  vapp_seedfrom    = "http://pi2.kuin.sh/homelab/"

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
  vapp_seedfrom    = "http://pi2.kuin.sh/homelab/"

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
  vapp_seedfrom    = "http://pi2.kuin.sh/homelab/"

  vms = ["cluster-worker-1", "cluster-worker-2", "cluster-worker-3", "cluster-worker-4", "cluster-worker-5"]
}

module "vm_flatcar" {
  source = "./modules/vm-ova-flatcar"

  folder              = "staging"
  resource_pool_id    = data.vsphere_resource_pool.emc_pool.id
  datastore_id        = data.vsphere_datastore.datastore.id
  template_uuid       = vsphere_content_library_item.flatcar.id
  guest_id            = "other5xLinux64Guest"
  num_cpus            = 2
  memory              = 4096
  network_id          = vsphere_distributed_port_group.dpg.id
  disk_size           = 128
  ignition_config_url = "http://pi2.kuin.sh/flatcar/ignition.json"

  vms = ["flatcar"]
}
