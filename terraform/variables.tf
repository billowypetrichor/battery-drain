variable "resource_group_name" {
  description = "The name of the resource group"
  type        = string
  default     = "myResourceGroup"
}

variable "location" {
  description = "The location of the resources"
  type        = string
  default     = "West Europe"
}

variable "aks_cluster_name" {
  description = "The name of the AKS cluster"
  type        = string
  default     = "myAKSCluster"
}

variable "cosmosdb_account_name" {
  description = "The name of the Cosmos DB account"
  type        = string
  default     = "myCosmosDBAccount"
}

variable "keyvault_name" {
  description = "The name of the Key Vault"
  type        = string
  default     = "myKeyVault"
}

variable "acr_name" {
  description = "The name of the Azure Container Registry"
  type        = string
  default     = "myACR"
}

variable "env_name" {
  description = "The name of the Environment"
  type        = string
  default     = "dev"
}