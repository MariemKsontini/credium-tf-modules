resource "azurerm_container_registry" "acr" {
  name                          = var.acr_name
  resource_group_name           = var.rg_name
  location                      = var.location
  sku                           = "Premium"
  admin_enabled                 = false
  tags                          = var.tags
  public_network_access_enabled = var.public_network_access_enabled


  dynamic "georeplications" {
    for_each = var.geo_replication_locations
    content {
      location                = georeplications.value
      zone_redundancy_enabled = var.zone_redundancy_enabled
      tags                    = var.tags
    }
  }

  network_rule_set {
    default_action = "Deny"
    ip_rule        = [
      for ip in var.ip_rules :
      {
        action   = "Allow"
        ip_range = ip
      }
    ]
  }

  identity {
    type = "SystemAssigned"
  }
}

data "azurerm_container_registry_scope_map" "repositories_pull" {
  name                    = "_repositories_pull"
  container_registry_name = azurerm_container_registry.acr.name
  resource_group_name     = var.rg_name
}

resource "azurerm_container_registry_token" "acr_pull_token" {
  name                    = var.acr_token_name
  container_registry_name = azurerm_container_registry.acr.name
  resource_group_name     = var.rg_name
  scope_map_id            = data.azurerm_container_registry_scope_map.repositories_pull.id
}

data "azurerm_container_registry_scope_map" "repositories_push" {
  name                    = "_repositories_push"
  container_registry_name = azurerm_container_registry.acr.name
  resource_group_name     = var.rg_name
}

resource "azurerm_container_registry_token" "acr_push_token" {
  name                    = var.acr_push_token_name
  container_registry_name = var.acr_name
  resource_group_name     = var.rg_name
  scope_map_id            = data.azurerm_container_registry_scope_map.repositories_push.id
}
