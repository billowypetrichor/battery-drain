resource "azurerm_key_vault" "main" {
  name                = var.keyvault_name
  location            = azurerm_resource_group.main.location
  resource_group_name = azurerm_resource_group.main.name
  tenant_id           = data.azurerm_client_config.current.tenant_id
  sku_name            = "standard"

  network_acls {
    default_action = "Deny"
    bypass         = "AzureServices"

    ip_rules = [
      "YOUR_IP_ADDRESS"
    ]

    virtual_network_subnet_ids = [
      "YOUR_VNET_SUBNET_ID"
    ]
  }

  access_policy {
    tenant_id = data.azurerm_client_config.current.tenant_id
    object_id = data.azurerm_client_config.current.object_id

    secret_permissions = [
      "get",
      "list",
      "set",
      "delete",
      "backup",
      "restore",
      "recover",
      "purge"
    ]

    key_permissions = [
      "get",
      "list",
      "create",
      "delete",
      "backup",
      "restore",
      "recover",
      "purge"
    ]

    certificate_permissions = [
      "get",
      "list",
      "delete",
      "create",
      "import",
      "update",
      "managecontacts",
      "getissuers",
      "listissuers",
      "setissuers",
      "deleteissuers",
      "manageissuers"
    ]
  }

  tags = local.tags
}

resource "random_password" "dct_repo_passphrase" {
  length  = 16
  special = true
}

resource "random_password" "dct_root_passphrase" {
  length  = 16
  special = true
}

resource "random_password" "argocd_password" {
  length  = 16
  special = true
}

resource "azurerm_key_vault_secret" "dct_repo_passphrase" {
  name         = "DCT_REPO_PASSPHRASE"
  value        = random_password.dct_repo_passphrase.result
  key_vault_id = azurerm_key_vault.main.id
}

resource "azurerm_key_vault_secret" "dct_root_passphrase" {
  name         = "DCT_ROOT_PASSPHRASE"
  value        = random_password.dct_root_passphrase.result
  key_vault_id = azurerm_key_vault.main.id
}

resource "azurerm_key_vault_secret" "argocd_password" {
  name         = "ARGOCD_PASSWORD"
  value        = random_password.argocd_password.result
  key_vault_id = azurerm_key_vault.main.id
}

resource "azurerm_key_vault_secret" "custom_seccomp_profile" {
  name         = "CUSTOM_SECCOMP_PROFILE"
  value        = file("path/to/seccomp/profile.json")
  key_vault_id = azurerm_key_vault.main.id
}

resource "azurerm_key_vault_secret" "argocd_server" {
  name         = "ARGOCD_SERVER"
  value        = var.argocd_server
  key_vault_id = azurerm_key_vault.main.id
}

resource "azurerm_key_vault_secret" "argocd_username" {
  name         = "ARGOCD_USERNAME"
  value        = var.argocd_username
  key_vault_id = azurerm_key_vault.main.id
}

resource "azurerm_key_vault_secret" "kubeconfig" {
  name         = "KUBECONFIG"
  value        = file(var.kubeconfig_path)
  key_vault_id = azurerm_key_vault.main.id
}