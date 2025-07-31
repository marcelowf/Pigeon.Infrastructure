module "app_service_plan_01" {
  source                = "../Pigeon.Skeletons/app_service_plan"
  app_service_plan_name = "asp-pigeon-${var.env_suffix}"
  resource_group_name   = azurerm_resource_group.rg.name
  location              = var.location
  sku_name              = "B1"
  os_type               = "Linux"
  tags                  = var.tags
}

module "function_app_01" {
  source               = "../Pigeon.Skeletons/function_app"
  function_app_name    = "func-pigeon-email-dispatcher-${var.env_suffix}"
  resource_group_name  = azurerm_resource_group.rg.name
  location             = var.location
  app_service_plan_id  = module.app_service_plan_01.id
  storage_account_name = module.storage_account_01.storage_account_name
  storage_account_key  = module.storage_account_01.storage_account_primary_access_key
  app_settings = {
    "AzureWebJobsStorage"            = module.storage_account_01.storage_account_primary_connection_string
    "FUNCTIONS_EXTENSION_VERSION"    = "~4"
    "FUNCTIONS_WORKER_RUNTIME": "dotnet-isolated"
    "APPINSIGHTS_INSTRUMENTATIONKEY" = module.app_insights_email.instrumentation_key
    "ServiceBusConnection"           = module.service_bus_01.namespace_connection_string
    "EmailQueueName" = module.service_bus_01.queue_names["email_dispatcher"]
  }
  tags = var.tags
}

module "function_app_02" {
  source               = "../Pigeon.Skeletons/function_app"
  function_app_name    = "func-pigeon-board-dispatcher-${var.env_suffix}"
  resource_group_name  = azurerm_resource_group.rg.name
  location             = var.location
  app_service_plan_id  = module.app_service_plan_01.id
  storage_account_name = module.storage_account_01.storage_account_name
  storage_account_key  = module.storage_account_01.storage_account_primary_access_key
  app_settings = {
    "AzureWebJobsStorage"            = module.storage_account_01.storage_account_primary_connection_string
    "FUNCTIONS_EXTENSION_VERSION"    = "~4"
    "FUNCTIONS_WORKER_RUNTIME": "dotnet-isolated"
    "APPINSIGHTS_INSTRUMENTATIONKEY" = module.app_insights_board.instrumentation_key
    "ServiceBusConnection"           = module.service_bus_01.namespace_connection_string
    "BoardQueueName" = module.service_bus_01.queue_names["board_dispatcher"]
  }
  tags = var.tags
}

module "app_insights_email" {
  source              = "../Pigeon.Skeletons/application_insights"
  name                = "appi-pigeon-email-dispatcher-${var.env_suffix}"
  location            = var.location
  resource_group_name = azurerm_resource_group.rg.name
  tags                = var.tags
}

module "app_insights_board" {
  source              = "../Pigeon.Skeletons/application_insights"
  name                = "appi-pigeon-board-dispatcher-${var.env_suffix}"
  location            = var.location
  resource_group_name = azurerm_resource_group.rg.name
  tags                = var.tags
}
