resource "azurerm_container_registry" "main" {
  name                = var.acr_name
  location            = azurerm_resource_group.main.location
  resource_group_name = azurerm_resource_group.main.name
  sku                 = "Standard"

  admin_enabled = false

  tags = local.tags
}