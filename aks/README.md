<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >=1.8.5 |
| <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) | ~> 3.108.0 |

## Resources

| Name | Type |
|------|------|
| [azurerm_kubernetes_cluster.aks](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/kubernetes_cluster) | resource |
| [azurerm_kubernetes_cluster_node_pool.aks](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/kubernetes_cluster_node_pool) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_additional_node_pools"></a> [additional\_node\_pools](#input\_additional\_node\_pools) | Map object to configure one or several additional node pools. The name of each map object is used as the node pool name. if `vm_size` and `os_disk_size_gb` are set to `null` the values for the default node pool will be used. | <pre>map(object({<br>    node_count          = number<br>    vm_size             = string<br>    labels              = map(string)<br>    taints              = list(string)<br>    availability_zones  = list(string)<br>    enable_auto_scaling = bool<br>    node_min_count      = number<br>    node_max_count      = number<br>    os_disk_size_gb     = number<br>  }))</pre> | `{}` | no |
| <a name="input_aks_name"></a> [aks\_name](#input\_aks\_name) | Name of the AKS | `string` | n/a | yes |
| <a name="input_automatic_channel_upgrade"></a> [automatic\_channel\_upgrade](#input\_automatic\_channel\_upgrade) | The upgrade channel for this Kubernetes Cluster | `string` | `null` | no |
| <a name="input_availability_zones"></a> [availability\_zones](#input\_availability\_zones) | Array of availability zones for the default system node pool. Setting this to `null` results in Azure picking zone 0. | `list(string)` | <pre>[<br>  "1",<br>  "2",<br>  "3"<br>]</pre> | no |
| <a name="input_dns_prefix"></a> [dns\_prefix](#input\_dns\_prefix) | Prefix of the DNS | `string` | n/a | yes |
| <a name="input_enable_auto_scaling"></a> [enable\_auto\_scaling](#input\_enable\_auto\_scaling) | Enable autoscaling on vm node pool. When set to true max\_count and min\_count needs to be defined | `bool` | `true` | no |
| <a name="input_enable_oms_agent"></a> [enable\_oms\_agent](#input\_enable\_oms\_agent) | Enable the OMS agent to make use of the container monitoring. If set to true a log analytics workspace id is required | `bool` | `false` | no |
| <a name="input_kubernetes_version"></a> [kubernetes\_version](#input\_kubernetes\_version) | Kubernetes version | `string` | `"1.22.4"` | no |
| <a name="input_location"></a> [location](#input\_location) | Azure location where the resources are deployed in | `string` | `"westeurope"` | no |
| <a name="input_log_analytics_workspace_id"></a> [log\_analytics\_workspace\_id](#input\_log\_analytics\_workspace\_id) | Id of an exiting log analytics workspace. Is required if 'enable\_oms\_agent' is set to `true` | `string` | `null` | no |
| <a name="input_maintenance_window_node_os"></a> [maintenance\_window\_node\_os](#input\_maintenance\_window\_node\_os) | Maintenance window configuration for node OS upgrades. | <pre>object({<br>    frequency   = string,<br>    interval    = number,<br>    duration    = number,<br>    day_of_week = string,<br>    start_time  = string<br>  })</pre> | `null` | no |
| <a name="input_max_count"></a> [max\_count](#input\_max\_count) | The maximum number of nodes which should exist in this Node Pool. If specified this must be between 1 and 1000. Required if enable\_auto\_scale is set to `true` | `number` | `6` | no |
| <a name="input_max_surge"></a> [max\_surge](#input\_max\_surge) | The maximum number or percentage of nodes which will be added to the Node Pool size during an upgrade | `string` | n/a | yes |
| <a name="input_min_count"></a> [min\_count](#input\_min\_count) | The minimum number of nodes which should exist in this Node Pool. If specified this must be between 1 and 1000. Required if enable\_auto\_scale is set to `true` | `number` | `3` | no |
| <a name="input_node_labels"></a> [node\_labels](#input\_node\_labels) | A map of Kubernetes labels which should be applied to nodes in the Default Node Pool. Changing this forces a new resource to be created. | `map(string)` | <pre>{<br>  "system": true<br>}</pre> | no |
| <a name="input_node_os_channel_upgrade"></a> [node\_os\_channel\_upgrade](#input\_node\_os\_channel\_upgrade) | The upgrade channel for the node OS. This controls when update will be applied to the node. | `string` | `null` | no |
| <a name="input_node_pool_count"></a> [node\_pool\_count](#input\_node\_pool\_count) | The number of nodes which should exist in this Node Pool. If specified this must be between 1 and 1000. Required if enable\_auto\_scale is set to `false` | `number` | `3` | no |
| <a name="input_node_pool_name"></a> [node\_pool\_name](#input\_node\_pool\_name) | Name of the AKS node pool | `string` | n/a | yes |
| <a name="input_node_pool_vm_size"></a> [node\_pool\_vm\_size](#input\_node\_pool\_vm\_size) | VM size of the AKS node pool | `string` | `"Standard_B2s"` | no |
| <a name="input_node_resource_group_name"></a> [node\_resource\_group\_name](#input\_node\_resource\_group\_name) | Name of the node resource group | `string` | `null` | no |
| <a name="input_only_critical_addons_enabled"></a> [only\_critical\_addons\_enabled](#input\_only\_critical\_addons\_enabled) | only critical addons enabled for default node pool | `bool` | `false` | no |
| <a name="input_orchestrator_version"></a> [orchestrator\_version](#input\_orchestrator\_version) | Orchestrator version | `string` | `"1.22.4"` | no |
| <a name="input_os_disk_size_gb"></a> [os\_disk\_size\_gb](#input\_os\_disk\_size\_gb) | The size of the OS Disk which should be used for each agent in the Node Pool. Changing this forces a new resource to be created | `number` | `64` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_aks_name"></a> [aks\_name](#output\_aks\_name) | The name of the aks cluster |
<!-- END_TF_DOCS -->