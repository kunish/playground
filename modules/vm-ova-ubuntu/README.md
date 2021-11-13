## Requirements

No requirements.

## Providers

| Name                                                               | Version |
| ------------------------------------------------------------------ | ------- |
| <a name="provider_terraform"></a> [terraform](#provider_terraform) | n/a     |
| <a name="provider_vsphere"></a> [vsphere](#provider_vsphere)       | n/a     |

## Modules

No modules.

## Resources

| Name                                                                                                                               | Type        |
| ---------------------------------------------------------------------------------------------------------------------------------- | ----------- |
| [vsphere_virtual_machine.vm](https://registry.terraform.io/providers/hashicorp/vsphere/latest/docs/resources/virtual_machine)      | resource    |
| [terraform_remote_state.router](https://registry.terraform.io/providers/hashicorp/terraform/latest/docs/data-sources/remote_state) | data source |

## Inputs

| Name                                                                              | Description | Type           | Default | Required |
| --------------------------------------------------------------------------------- | ----------- | -------------- | ------- | :------: |
| <a name="input_datastore_id"></a> [datastore_id](#input_datastore_id)             | n/a         | `string`       | n/a     |   yes    |
| <a name="input_disk_size"></a> [disk_size](#input_disk_size)                      | n/a         | `number`       | n/a     |   yes    |
| <a name="input_folder"></a> [folder](#input_folder)                               | n/a         | `string`       | n/a     |   yes    |
| <a name="input_guest_id"></a> [guest_id](#input_guest_id)                         | n/a         | `string`       | n/a     |   yes    |
| <a name="input_memory"></a> [memory](#input_memory)                               | n/a         | `number`       | n/a     |   yes    |
| <a name="input_network_id"></a> [network_id](#input_network_id)                   | n/a         | `string`       | n/a     |   yes    |
| <a name="input_num_cpus"></a> [num_cpus](#input_num_cpus)                         | n/a         | `number`       | n/a     |   yes    |
| <a name="input_resource_pool_id"></a> [resource_pool_id](#input_resource_pool_id) | n/a         | `string`       | n/a     |   yes    |
| <a name="input_template_uuid"></a> [template_uuid](#input_template_uuid)          | n/a         | `string`       | n/a     |   yes    |
| <a name="input_vapp_seedfrom"></a> [vapp_seedfrom](#input_vapp_seedfrom)          | n/a         | `string`       | n/a     |   yes    |
| <a name="input_vms"></a> [vms](#input_vms)                                        | n/a         | `list(string)` | n/a     |   yes    |

## Outputs

| Name                                         | Description |
| -------------------------------------------- | ----------- |
| <a name="output_vms"></a> [vms](#output_vms) | n/a         |
