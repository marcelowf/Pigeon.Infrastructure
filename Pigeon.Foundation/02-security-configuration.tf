module "kv_qa" {
  source              = "../Pigeon.Skeletons/key_vault"
  key_vault_name      = "kv-pigeon-${var.env_suffix}"
  location            = var.location
  resource_group_name = azurerm_resource_group.rg.name
  tags                = var.tags

  access_policies = [
    {
      object_id           = data.azurerm_client_config.current.object_id
      key_permissions     = ["Get", "List", "Delete", "Purge", "Recover"]
      secret_permissions  = ["Get", "List", "Set", "Delete", "Purge", "Recover"]
      storage_permissions = ["Get", "List", "Set", "Delete", "Purge", "Recover"]
    },
    {
      object_id           = module.function_app_01.principal_id
      key_permissions     = ["Get", "List"]
      secret_permissions  = ["Get", "List"]
      storage_permissions = ["Get", "List"]
    },
    {
      object_id           = module.function_app_02.principal_id
      key_permissions     = ["Get", "List"]
      secret_permissions  = ["Get", "List"]
      storage_permissions = ["Get", "List"]
    },
    {
      object_id           = "de50d8e1-495e-4135-8cb4-a471808b0ed6"
      key_permissions     = ["Get", "List", "Delete", "Purge", "Recover"]
      secret_permissions  = ["Get", "List", "Set", "Delete", "Purge", "Recover"]
      storage_permissions = ["Get", "List", "Set", "Delete", "Purge", "Recover"]
    },
    {
      object_id           = "4028d410-6c37-4072-9692-65c7c74fc59a"
      key_permissions     = ["Get", "List", "Delete", "Purge", "Recover"]
      secret_permissions  = ["Get", "List", "Set", "Delete", "Purge", "Recover"]
      storage_permissions = ["Get", "List", "Set", "Delete", "Purge", "Recover"]
    },
  ]
}

resource "azurerm_key_vault_secret" "email_form" {
  name         = "EmailSettings--FromEmail"
  value        = var.sender_email
  key_vault_id = module.kv_qa.id
}

resource "azurerm_key_vault_secret" "email_password" {
  name         = "EmailSettings--Password"
  value        = var.sender_key
  key_vault_id = module.kv_qa.id
}

resource "azurerm_key_vault_secret" "email_smtp_host" {
  name         = "EmailSettings--SmtpHost"
  value        = "smtp.gmail.com"
  key_vault_id = module.kv_qa.id
}

resource "azurerm_key_vault_secret" "email_smtp_port" {
  name         = "EmailSettings--SmtpPort"
  value        = "587"
  key_vault_id = module.kv_qa.id
}

resource "azurerm_key_vault_secret" "dev_ops_org" {
  name         = "DevOpsSettings--Organization"
  value        = var.azure_devops_org
  key_vault_id = module.kv_qa.id
}

resource "azurerm_key_vault_secret" "dev_ops_proj" {
  name         = "DevOpsSettings--Project"
  value        = var.azure_devops_proj
  key_vault_id = module.kv_qa.id
}

resource "azurerm_key_vault_secret" "dev_ops_pat" {
  name         = "DevOpsSettings--Pat"
  value        = var.azure_devops_pat
  key_vault_id = module.kv_qa.id
}
