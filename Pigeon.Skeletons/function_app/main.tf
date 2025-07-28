locals {
  function_app_name    = var.function_app_name
  resource_group_name  = var.resource_group_name
  location             = var.location
  app_service_plan_id  = var.app_service_plan_id
  storage_account_name = var.storage_account_name
  storage_account_key  = var.storage_account_key
  app_settings         = var.app_settings
  tags                 = var.tags
}

resource "azurerm_linux_function_app" "function" {
  name                       = local.function_app_name
  resource_group_name        = local.resource_group_name
  location                   = local.location
  service_plan_id            = local.app_service_plan_id
  storage_account_name       = local.storage_account_name
  storage_account_access_key = local.storage_account_key
  https_only                 = true
  tags                       = local.tags

  site_config {
    application_stack {
      dotnet_version = "6.0" # ou node_version/python_version se necessário
    }
  }

  app_settings = merge({
    "WEBSITE_RUN_FROM_PACKAGE" = "1"
  }, local.app_settings)
}

