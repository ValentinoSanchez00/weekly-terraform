locals {
  vm_keys = keys(var.vm_definitions) # Obtiene las claves de vm_definitions
  vm_keys_map = { for idx, key in local.vm_keys : key => idx } # Convierte la lista de claves en un mapa
  vm_to_subnet_index = zipmap(local.vm_keys, range(length(local.vm_keys))) # Asocia claves de VM a índices de subred
}
# IPs para las máquinas virtuales
resource "azurerm_public_ip" "vm_ips" {
  for_each            = local.vm_keys_map 
  name                = "${each.key}-public-ip"
  location            = var.location
  resource_group_name = var.gr_name
  allocation_method   = "Static"
  sku                 = "Standard"
  tags = {
    Name = "${each.key}-public-ip"
  }
}
# IP adicional
resource "azurerm_public_ip" "extra_ip" {
  count               = 1
  name                = "extra-public-ip"
  location            = var.location
  resource_group_name = var.gr_name
  allocation_method   = "Static"
  sku                 = "Standard"
  tags = {
    Name = "extra-public-ip"
  }
}
# Interfaces de red para las máquinas virtuales
resource "azurerm_network_interface" "vm_nic" {
  for_each            = local.vm_keys_map 
  name                = "${each.key}-nic"
  location            = var.location
  resource_group_name = var.gr_name
  ip_configuration {
    name                         = "internal"
    subnet_id                    = var.subnet_id[local.vm_to_subnet_index[each.key]]
    public_ip_address_id         = azurerm_public_ip.vm_ips[each.key].id
    private_ip_address_allocation = "Dynamic"
  }
}
# Local con todas las IPs públicas (IPs de VMs y la IP adicional)
locals {
  public_ip_ids = concat([for ip in azurerm_public_ip.vm_ips : ip.id], [azurerm_public_ip.extra_ip[0].id])
  last_public_ip_id = azurerm_public_ip.extra_ip[0].id
}
# Balanceador de cargas usando la última IP (la adicional)
resource "azurerm_lb" "example" {
  name                = "TestLoadBalancer"
  location            = var.location
  resource_group_name = var.gr_name
  frontend_ip_configuration {
    name                 = "PublicIPAddress-frontend"
    public_ip_address_id = local.last_public_ip_id
  }
}