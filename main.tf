locals {
  nic_name                        = "${var.name}-nic"
  dns_zone_link_name              = "dns-zone-link"
  private_service_connection_name = "private-connection"
}

resource "azurerm_private_endpoint" "private_endpoint" {
  name                          = var.name
  location                      = var.location
  resource_group_name           = var.resource_group_name
  subnet_id                     = var.subnet_id
  custom_network_interface_name = local.nic_name

  private_service_connection {
    name                           = local.private_service_connection_name
    is_manual_connection           = false
    private_connection_resource_id = var.resource_id
    subresource_names              = [var.subresource_name]
  }

  dynamic "private_dns_zone_group" {
    for_each = var.private_dns_enabled ? [true] : []

    content {
      name                 = local.dns_zone_link_name
      private_dns_zone_ids = [var.private_dns_zone_id]
    }
  }

  lifecycle {
    ignore_changes = [tags["CreationDateTime"], tags["Environment"]]
  }
}

locals {
  nic_diagnostic_name = "${azurerm_private_endpoint.private_endpoint.network_interface[0].name}-diagnostic"
}

module "nic-diagnostic" {
  source                     = "github.com/danielkhen/diagnostic_setting_module"
  name                       = local.nic_diagnostic_name
  target_resource_id         = azurerm_private_endpoint.private_endpoint.network_interface[0].id
  log_analytics_workspace_id = var.log_analytics_id
}