output "subnet_names" {
  value = { for key, subnet in azurerm_subnet.subnet : key => subnet.name }
}
output "subnet_address_prefixes" {
  value = { for key, subnet in azurerm_subnet.subnet : key => subnet.address_prefixes }
}
output "subnet_id" {
   value = { for key, subnet in azurerm_subnet.subnet : key => subnet.id }
}