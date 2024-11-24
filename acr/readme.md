# Terraform Module for Azure Container Registry

A module to create an [Azure container registry](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/container_registry).

## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >=1.3.0 |
| <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) | ~> 3.37.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | 3.29.1 |


## Resources

| Name | Type |
|------|------|
| [azurerm_container_registry.acr](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/container_registry) | resource |
| [azurerm_container_registry_token.acr_pull_token](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/container_registry_token) | resource |
| [azurerm_container_registry_token.acr_push_token](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/container_registry_token) | resource |
| [azurerm_container_registry_scope_map.repositories_pull](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/container_registry_scope_map) | data source |
| [azurerm_container_registry_scope_map.repositories_push](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/container_registry_scope_map) | data source |

## Inputs

| Name | Description | Type | Default                                                                                    | Required |
|------|-------------|------|--------------------------------------------------------------------------------------------|:--------:|
| <a name="input_acr_name"></a> [acr\_name](#input\_acr\_name) | Name of the container registry | `string` | n/a                                                                                        |   yes    |
| <a name="input_acr_push_token_name"></a> [acr\_push\_token\_name](#input\_acr\_push\_token\_name) | Name of the acr push token resource | `string` | `"pipeline-token"`                                                                         |    no    |
| <a name="input_acr_token_name"></a> [acr\_token\_name](#input\_acr\_token\_name) | Name of the acr token resource | `string` | `"aks-pull-token"`                                                                         |    no    |
| <a name="input_geo_replication_locations"></a> [geo\_replication\_locations](#input\_geo\_replication\_locations) | List of azure locations where the container registry should be replicated. | `set(string)` | `[]`                                                                                       |    no    |
| <a name="input_ip_rules"></a> [ip\_rules](#input\_ip\_rules) | One or more IP Addresses, or CIDR Blocks which should be able to access the ACR | `set(string)` |</pre> |    no    |
| <a name="input_location"></a> [location](#input\_location) | Azure location where the resources are deployed in | `string` | `"westeurope"`                                                                             |    no    |
| <a name="input_rg_name"></a> [rg\_name](#input\_rg\_name) | Name of the resource group in which the ACR should be created | `string` | n/a                                                                                        |   yes    |
| <a name="input_subnet_ids"></a> [subnet\_ids](#input\_subnet\_ids) | List of subnet IDs from which network access to the ACR will be allowed | `set(string)` | `[]`                                                                                       |    no    |
| <a name="input_public_network_access_enabled"></a> [public\_network\_access\_enabled](#input\_public\_network\_access\_enabled) | Enabling public access for ACR. If this variable is set to 'false' then we need to set IP rules to blank (ip_rules = []) in the repository which will refer pkt-cloud-migration-tf-modules as source. | `bool` | `false` |   yes    | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_acr_token_id"></a> [acr\_token\_id](#output\_acr\_token\_id) | ID of the acr pull token |
<!-- END_TF_DOCS -->
