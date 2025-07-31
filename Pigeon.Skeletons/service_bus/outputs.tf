output "namespace_connection_string" {
  value = azurerm_servicebus_namespace.sb.default_primary_connection_string
}

output "namespace_primary_connection_string" {
  value = azurerm_servicebus_namespace.sb.default_primary_connection_string
}

output "namespace_id" {
  value = azurerm_servicebus_namespace.sb.id
}

output "queue_ids" {
  value = { for name, q in azurerm_servicebus_queue.queues : name => q.id }
}

output "queue_names" {
  value = { for name, q in azurerm_servicebus_queue.queues : name => q.name }
}
