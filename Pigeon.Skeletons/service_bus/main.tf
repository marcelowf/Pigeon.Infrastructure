resource "azurerm_servicebus_namespace" "sb" {
  name                = var.namespace_name
  location            = var.location
  resource_group_name = var.resource_group_name
  sku                 = "Standard"
  tags                = var.tags
}

resource "azurerm_servicebus_queue" "queues" {
  for_each     = toset(var.queue_names)
  name         = each.value
  namespace_id = azurerm_servicebus_namespace.sb.id
}
