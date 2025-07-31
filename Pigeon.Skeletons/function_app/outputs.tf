output "name" {
  value = azurerm_linux_function_app.function.name
}

output "principal_id" {
  description = "The principal ID of the system-assigned managed identity."
  value       = azurerm_linux_function_app.function.identity[0].principal_id
}
