variable "gr_name" {
  description = "resource group name"
  type = string
}


variable "vnet_address_space" {
  type = list(string)
  default = [ "10.0.0.0/16" ]
  validation {
    condition = var.vnet_address_space != null && length(var.vnet_address_space) > 0
    error_message = "La IP de la VNet debe ser especificada."
  }
}

variable "location" {
  type = string
  default = "West Europe"
  
}
variable "dns_servers" {
  type = list(string)
  default = ["10.0.0.4", "10.0.0.5"]
  validation {
    condition = var.dns_servers != null && length(var.dns_servers) > 0
    error_message = "El servidor DNS debe ser especificado."
  }
}


