provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "main" {
  name     = var.resource_group_name
  location = var.location
}

module "aks" {
  source = "./aks.tf"
}

module "cosmosdb" {
  source = "./cosmosdb.tf"
}

module "keyvault" {
  source = "./keyvault.tf"
}

module "acr" {
  source = "./acr.tf"
}