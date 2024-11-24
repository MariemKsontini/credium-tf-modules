output "acr_token_id" {
  description = "ID of the acr pull token"
  value       = azurerm_container_registry_token.acr_pull_token.id
}
output "acr_id" {
  description = "ID of acr"
  value       = azurerm_container_registry.acr.id
}