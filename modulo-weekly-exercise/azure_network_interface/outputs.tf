output "network_interface_ids" {
  value = {for idx, nic in azurerm_network_interface.vm_nic : idx => nic.ip_configuration[0].public_ip_address_id}
}