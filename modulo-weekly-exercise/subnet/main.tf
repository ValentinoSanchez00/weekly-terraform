
locals {
  count_vm = length(var.vm_definitions)
}
resource "azurerm_subnet" "subnet" {
  count = local.count_vm
  name = "subnet-weekly-exercise${count.index}"
  resource_group_name = var.gr_name
  virtual_network_name = var.vnet_name
  address_prefixes = ["10.0.${count.index}.0/24"]
}