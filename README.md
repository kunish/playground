# Playground

## Requirements

No requirements.

## Providers

| Name                                                         | Version |
| ------------------------------------------------------------ | ------- |
| <a name="provider_vsphere"></a> [vsphere](#provider_vsphere) | 2.0.2   |

## Modules

| Name                                                                                                     | Source                  | Version |
| -------------------------------------------------------------------------------------------------------- | ----------------------- | ------- |
| <a name="module_vm_cluster_controlplane"></a> [vm_cluster_controlplane](#module_vm_cluster_controlplane) | ./modules/vm-ova-ubuntu | n/a     |
| <a name="module_vm_cluster_proxy"></a> [vm_cluster_proxy](#module_vm_cluster_proxy)                      | ./modules/vm-ova-ubuntu | n/a     |
| <a name="module_vm_cluster_worker"></a> [vm_cluster_worker](#module_vm_cluster_worker)                   | ./modules/vm-ova-ubuntu | n/a     |
| <a name="module_vm_jarvy"></a> [vm_jarvy](#module_vm_jarvy)                                              | ./modules/vm-ova-ubuntu | n/a     |
| <a name="module_vm_large"></a> [vm_large](#module_vm_large)                                              | ./modules/vm-ova-ubuntu | n/a     |
| <a name="module_vm_mini"></a> [vm_mini](#module_vm_mini)                                                 | ./modules/vm-ova-ubuntu | n/a     |

## Resources

| Name                                                                                                                                                 | Type        |
| ---------------------------------------------------------------------------------------------------------------------------------------------------- | ----------- |
| [vsphere_content_library.library](https://registry.terraform.io/providers/hashicorp/vsphere/latest/docs/resources/content_library)                   | resource    |
| [vsphere_content_library_item.flatcar](https://registry.terraform.io/providers/hashicorp/vsphere/latest/docs/resources/content_library_item)         | resource    |
| [vsphere_content_library_item.ubuntu](https://registry.terraform.io/providers/hashicorp/vsphere/latest/docs/resources/content_library_item)          | resource    |
| [vsphere_datacenter.datacenter](https://registry.terraform.io/providers/hashicorp/vsphere/latest/docs/resources/datacenter)                          | resource    |
| [vsphere_distributed_port_group.dpg](https://registry.terraform.io/providers/hashicorp/vsphere/latest/docs/resources/distributed_port_group)         | resource    |
| [vsphere_distributed_virtual_switch.dvs](https://registry.terraform.io/providers/hashicorp/vsphere/latest/docs/resources/distributed_virtual_switch) | resource    |
| [vsphere_folder.folders](https://registry.terraform.io/providers/hashicorp/vsphere/latest/docs/resources/folder)                                     | resource    |
| [vsphere_host.emc](https://registry.terraform.io/providers/hashicorp/vsphere/latest/docs/resources/host)                                             | resource    |
| [vsphere_host.nuc](https://registry.terraform.io/providers/hashicorp/vsphere/latest/docs/resources/host)                                             | resource    |
| [vsphere_vapp_container.cluster](https://registry.terraform.io/providers/hashicorp/vsphere/latest/docs/resources/vapp_container)                     | resource    |
| [vsphere_vapp_entity.entity_cluster_controlplane](https://registry.terraform.io/providers/hashicorp/vsphere/latest/docs/resources/vapp_entity)       | resource    |
| [vsphere_vapp_entity.entity_cluster_proxy](https://registry.terraform.io/providers/hashicorp/vsphere/latest/docs/resources/vapp_entity)              | resource    |
| [vsphere_vapp_entity.entity_cluster_worker](https://registry.terraform.io/providers/hashicorp/vsphere/latest/docs/resources/vapp_entity)             | resource    |
| [vsphere_datastore.datastore](https://registry.terraform.io/providers/hashicorp/vsphere/latest/docs/data-sources/datastore)                          | data source |
| [vsphere_datastore.nuc](https://registry.terraform.io/providers/hashicorp/vsphere/latest/docs/data-sources/datastore)                                | data source |
| [vsphere_network.nic](https://registry.terraform.io/providers/hashicorp/vsphere/latest/docs/data-sources/network)                                    | data source |
| [vsphere_resource_pool.emc_pool](https://registry.terraform.io/providers/hashicorp/vsphere/latest/docs/data-sources/resource_pool)                   | data source |
| [vsphere_resource_pool.nuc_pool](https://registry.terraform.io/providers/hashicorp/vsphere/latest/docs/data-sources/resource_pool)                   | data source |

## Inputs

| Name                                                                              | Description | Type     | Default | Required |
| --------------------------------------------------------------------------------- | ----------- | -------- | ------- | :------: |
| <a name="input_esxi_password"></a> [esxi_password](#input_esxi_password)          | n/a         | `string` | n/a     |   yes    |
| <a name="input_esxi_username"></a> [esxi_username](#input_esxi_username)          | n/a         | `string` | n/a     |   yes    |
| <a name="input_vsphere_password"></a> [vsphere_password](#input_vsphere_password) | n/a         | `string` | n/a     |   yes    |
| <a name="input_vsphere_server"></a> [vsphere_server](#input_vsphere_server)       | n/a         | `string` | n/a     |   yes    |
| <a name="input_vsphere_user"></a> [vsphere_user](#input_vsphere_user)             | n/a         | `string` | n/a     |   yes    |

## Outputs

No outputs.
