output "vnet_name" {
    value = azurerm_virtual_network.vnet.name
}
output "vnet_address_space" {
    value = azurerm_virtual_network.vnet.address_space
}
output "vnet_location" {
    value = azurerm_virtual_network.vnet.location
}
output "vnet_rg" {
    value = azurerm_virtual_network.vnet.resource_group_name
}