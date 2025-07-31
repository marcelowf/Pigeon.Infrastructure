module "service_bus_01" {
  source              = "../Pigeon.Skeletons/service_bus"
  namespace_name      = "sb-pigeon-${var.env_suffix}"
  queue_names         = ["email_dispatcher", "board_dispatcher", "teams_dispatcher"]
  location            = var.location
  resource_group_name = azurerm_resource_group.rg.name
  tags                = var.tags
}
