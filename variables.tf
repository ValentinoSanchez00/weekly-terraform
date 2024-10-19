variable "gr_name" {
    type = string
  
}
variable "tenant_id" {
  description = "Tenant ID"
  type = string
  default = "2835cee8-01b5-4561-b27c-2027631bcfe1"
}

variable "subscription_id" {
  description = "Subscription ID"
  type = string
  default = "86f76907-b9d5-46fa-a39d-aff8432a1868"
}

variable "vm_definitions" {
  
  type = map(object({
    vm_size           = string   
    admin_username    = string   
    admin_password    = string   
    image_publisher   = string   
    image_offer       = string   
    image_sku         = string  
    tags              = map(string) 
  }))
  description = "Definición de las máquinas virtuales a desplegar"
  

}

  
variable "location" {
  type = string
  default = "West Europe"
}
variable "address_space" {
  type = list(string)
  
}