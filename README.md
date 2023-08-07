<!-- BEGIN_TF_DOCS -->

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | n/a |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_location"></a> [location](#input\_location) | (Required) The location of the private endpoint and private dns zone. | `string` | n/a | yes |
| <a name="input_log_analytics_id"></a> [log\_analytics\_id](#input\_log\_analytics\_id) | (Required) The id of the log analytics workspace. | `string` | n/a | yes |
| <a name="input_name"></a> [name](#input\_name) | (Required) The name of the private endpoint. | `string` | n/a | yes |
| <a name="input_private_dns_enabled"></a> [private\_dns\_enabled](#input\_private\_dns\_enabled) | (Optional) Should a private dns zone be included. | `bool` | `false` | no |
| <a name="input_private_dns_zone_id"></a> [private\_dns\_zone\_id](#input\_private\_dns\_zone\_id) | (Optional) The id of the private dns zone to link with the private endpoint. | `string` | `null` | no |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | (Required) The name of the resource group. | `string` | n/a | yes |
| <a name="input_resource_id"></a> [resource\_id](#input\_resource\_id) | (Required) The resource id to associate with the private endpoint. | `string` | n/a | yes |
| <a name="input_subnet_id"></a> [subnet\_id](#input\_subnet\_id) | (Required) The subnet id for the private endpoint. | `string` | n/a | yes |
| <a name="input_subresource_name"></a> [subresource\_name](#input\_subresource\_name) | (Required) The subresource to associate with the private endpoint. | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_id"></a> [id](#output\_id) | The id of the private endpoint. |
| <a name="output_name"></a> [name](#output\_name) | The name of the private endpoint. |
| <a name="output_object"></a> [object](#output\_object) | The object of the private endpoint. |

## Resources

| Name | Type |
|------|------|
| [azurerm_private_endpoint.private_endpoint](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/private_endpoint) | resource |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_nic-diagnostic"></a> [nic-diagnostic](#module\_nic-diagnostic) | github.com/danielkhen/diagnostic_setting_module | n/a |

## Example Code

```hcl
module "private_endpoint" {
  source = "github.com/danielkhen/private_endpoint_module"

  name                = "example-pe"
  location            = "westeurope"
  resource_group_name = azurerm_resource_group.example.name
  resource_id         = azurerm_storage_account.example.id
  subnet_id           = azurerm_subnet.example.id
  subresource_name    = "blob"

  private_dns_enabled = true
  dns_name            = "privatelink.blob.core.windows.net"

  log_analytics_id = azurerm_log_analytics_workspace.example.id
}
```
<!-- END_TF_DOCS -->