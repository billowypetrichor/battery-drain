output "aks_cluster_name" {
  value = azurerm_kubernetes_cluster.main.name
}

output "cosmosdb_account_name" {
  value = azurerm_cosmosdb_account.main.name
}

output "keyvault_name" {
  value = azurerm_key_vault.main.name
}

output "acr_name" {
  value = azurerm_container_registry.main.name
}