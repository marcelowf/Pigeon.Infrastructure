module "storage_account_01" {
  source                   = "../Pigeon.Skeletons/storage_account"
  sa_name                  = "sapigeon${var.env_suffix}"
  location                 = var.location
  resource_group_name      = azurerm_resource_group.rg.name
  tags                     = var.tags
  account_tier             = "Standard"
  account_replication_type = "LRS"
}

resource "azurerm_storage_container" "scripts" {
  name                  = "container-pigeon-${var.env_suffix}"
  storage_account_id    = module.storage_account_01.storage_account_id
  container_access_type = "blob"
}
