# Terraform Module to create Azure Resource Group

A module to create a [resource group](https://docs.microsoft.com/en-us/azure/azure-resource-manager/management/manage-resource-groups-portal)

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | ~> 3.37.0 |


## Resources

| Name | Type |
|------|------|
| [azurerm_resource_group.rg](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/resource_group) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_location"></a> [location](#input\_location) | Azure location where the resources are deployed to | `string` | `"westeurope"` | no |
| <a name="input_rg_name"></a> [rg\_name](#input\_rg\_name) | Name of the resource group | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_rg_name"></a> [rg\_name](#output\_rg\_name) | Name of the resource group |
<!-- END_TF_DOCS -->
