output "my_nsg_id" {
  description = "El ID del grupo de seguridad de red"
  value       = { for k, v in azurerm_network_security_group.vm_nsg : k => v.id }
}