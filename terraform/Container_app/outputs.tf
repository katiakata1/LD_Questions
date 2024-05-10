output "container_app_ip_address" {
  value = azurerm_container_app.container_app.outbound_ip_addresses
}