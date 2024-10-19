resource "azurerm_virtual_machine" "vm" {
  for_each = var.vm_definitions
  name                  = each.key
  location              = var.location
  resource_group_name   = var.rg_name
  network_interface_ids = [var.network_interface_ids[each.key]]
  vm_size               = each.value.vm_size
  storage_image_reference {
    publisher = each.value.image_publisher
    offer     = each.value.image_offer
    sku       = each.value.image_sku
    version   = "latest"
  }
  storage_os_disk {
    name              = "${each.key}-osdisk"
    caching           = "ReadWrite"
    create_option     = "FromImage"
    managed_disk_type = "Standard_LRS"
  }
  os_profile {
    computer_name  = each.key
    admin_username = each.value.admin_username
    admin_password = each.value.admin_password  
  }
  os_profile_linux_config {
    disable_password_authentication = false  
  }
  tags = merge({
    "Name" = each.key
  }, each.value.tags)
}
resource "azurerm_network_security_group" "vm_nsg" {
  for_each = var.vm_definitions
  name                = "${each.key}-nsg"
  location            = var.location
  resource_group_name = var.rg_name
  security_rule {
    name                       = "allow_ssh"
    priority                   = 1001
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "22"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }
}