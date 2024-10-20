variable "gr_name" {
    type = string
  
}
variable "tenant_id" {
  description = "Tenant ID"
  type = string
  default = "${secret.ARM_TENANT_ID}"
}
variable "subscription_id" {
  description = "Subscription ID"
  type = string
  default = "${secret.ARM_SUBSCRIPTION_ID}"
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