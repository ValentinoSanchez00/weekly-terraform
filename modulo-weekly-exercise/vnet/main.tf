resource "azurerm_virtual_network" "vnet" {
    name = "virtual_network_weekly_exercise"
    location = var.location
    resource_group_name = var.gr_name
    address_space = var.vnet_address_space
    dns_servers = var.dns_servers
    
 
}






