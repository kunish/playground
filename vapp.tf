resource "vsphere_vapp_container" "cluster" {
  name                    = "cluster"
  parent_resource_pool_id = data.vsphere_resource_pool.pool.id
}

resource "vsphere_vapp_entity" "entities_cluster" {
  for_each     = vsphere_virtual_machine.vms_cluster
  container_id = vsphere_vapp_container.cluster.id
  target_id    = each.value.moid
  start_order  = local.vms_cluster[each.key].start_order
  start_delay  = 30
}
