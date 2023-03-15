output "vip" {
  description = "Public IP"
  value       = azurerm_public_ip.public_ip.ip_address
}

output "admin-password" {
  description = "The password of the admin"
  value       = azurerm_container_registry.registry.admin_password
  sensitive   = true
}