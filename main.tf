terraform {
  required_version = ">= 1.0"
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.5.0"
    }
  }
}
provider "azurerm" {
  features {}
  subscription_id = var.subscription_id
  tenant_id       = var.tenant_id
  use_cli         = true
}
module "vnet" {
  source = "./modulo-weekly-exercise/vnet"
  gr_name = var.gr_name
  vnet_address_space = var.address_space
  location=var.location
}

module "subnet" {
  source = "./modulo-weekly-exercise/subnet"
  gr_name = var.gr_name
  vnet_name = module.vnet.vnet_name
  vm_definitions = var.vm_definitions
}
module "networkInterface" {
  source = "./modulo-weekly-exercise/azure_network_interface"
  gr_name = var.gr_name
  vm_definitions = var.vm_definitions
  location=var.location
  subnet_id = module.subnet.subnet_id
}

module "virtualMachine" {
  source = "./modulo-weekly-exercise/virtual_machine"
  vm_definitions = var.vm_definitions
  location=var.location
  rg_name=var.gr_name
  network_interface_ids = module.networkInterface.network_interface_ids

}