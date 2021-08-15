resource "vsphere_vapp_container" "cluster" {
  name                    = "cluster"
  parent_resource_pool_id = data.vsphere_resource_pool.emc_pool.id
}

resource "vsphere_vapp_entity" "entity_cluster_proxy" {
  for_each     = module.vm_cluster_proxy.vms
  container_id = vsphere_vapp_container.cluster.id
  target_id    = each.value.moid
  start_order  = 1
  start_delay  = 30
}

resource "vsphere_vapp_entity" "entity_cluster_controlplane" {
  for_each     = module.vm_cluster_controlplane.vms
  container_id = vsphere_vapp_container.cluster.id
  target_id    = each.value.moid
  start_order  = 2
  start_delay  = 30
}

resource "vsphere_vapp_entity" "entity_cluster_worker" {
  for_each     = module.vm_cluster_worker.vms
  container_id = vsphere_vapp_container.cluster.id
  target_id    = each.value.moid
  start_order  = 3
  start_delay  = 30
}
