output "aks_name" {
  description = "The name of the aks cluster"
  value       = azurerm_kubernetes_cluster.aks.name
}