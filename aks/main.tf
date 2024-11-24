locals {
  type                  = "VirtualMachineScaleSets"
  enable_node_public_ip = false
}

resource "azurerm_kubernetes_cluster" "aks" {
  name                                = var.aks_name
  location                            = var.location
  resource_group_name                 = var.rg_name
  dns_prefix                          = var.dns_prefix
  node_resource_group                 = var.node_resource_group_name
  kubernetes_version                  = var.kubernetes_version
  sku_tier                            = var.sku
  private_cluster_enabled             = true
  private_dns_zone_id                 = "None"
  private_cluster_public_fqdn_enabled = true
  azure_policy_enabled                = true
  role_based_access_control_enabled   = true


  default_node_pool {
    name                         = var.node_pool_name
    temporary_name_for_rotation  = "${var.node_pool_name}tmp"
    orchestrator_version         = var.orchestrator_version
    node_count                   = var.enable_auto_scaling ? null : var.node_pool_count
    enable_auto_scaling          = var.enable_auto_scaling
    max_count                    = var.enable_auto_scaling ? var.max_count : null
    min_count                    = var.enable_auto_scaling ? var.min_count : null
    vm_size                      = var.node_pool_vm_size
    vnet_subnet_id               = var.subnet_id
    zones                        = var.availability_zones
    os_disk_size_gb              = var.os_disk_size_gb
    type                         = local.type
    enable_node_public_ip        = local.enable_node_public_ip
    os_disk_type                 = var.os_disk_type
    node_labels                  = var.node_labels
    only_critical_addons_enabled = var.only_critical_addons_enabled
    upgrade_settings {
      max_surge = var.max_surge
    }
    linux_os_config {
      sysctl_config {
        vm_max_map_count = 262144
      }
    }
  }

  identity {
    type         = "UserAssigned"
    identity_ids = [var.user_assigned_identity_id]
  }
}

resource "azurerm_kubernetes_cluster_node_pool" "aks" {
  for_each              = var.additional_node_pools
  kubernetes_cluster_id = azurerm_kubernetes_cluster.aks.id
  name                  = each.key
  orchestrator_version  = var.orchestrator_version
  node_count            = each.value.enable_auto_scaling ? null : each.value.node_count
  vm_size               = coalesce(each.value.vm_size, var.node_pool_vm_size)
  zones                 = each.value.availability_zones
  os_disk_size_gb       = coalesce(each.value.os_disk_size_gb, var.os_disk_size_gb)
  vnet_subnet_id        = var.subnet_id
  node_labels           = each.value.labels
  node_taints           = each.value.taints
  enable_auto_scaling   = each.value.enable_auto_scaling
  min_count             = each.value.enable_auto_scaling ? each.value.node_min_count : null
  max_count             = each.value.enable_auto_scaling ? each.value.node_max_count : null
  enable_node_public_ip = local.enable_node_public_ip
  os_disk_type          = var.os_disk_type
  tags                  = var.tags
  upgrade_settings {
    max_surge = var.max_surge
  }
}


