
gr_name   = "rg-vsanchez-dvfinlab"
address_space = ["10.0.0.0/16"]
vm_definitions = {
    "vm1" = {
      vm_size          = "Standard_DS1_v2"
      admin_username   = "azureuser"
      admin_password   = "P@ssw0rd123!"
      image_publisher  = "Canonical"
      image_offer      = "UbuntuServer"
      image_sku        = "18.04-LTS"
      tags = {
        Environment = "development"
        Project     = "test"
      }
    },
    "vm2" = {
      vm_size          = "Standard_DS1_v2"
      admin_username   = "azureuser"
      admin_password   = "P@ssw0rd123!"
      image_publisher  = "Canonical"
      image_offer      = "UbuntuServer"
      image_sku        = "18.04-LTS"
      tags = {
        Environment = "development"
        Project     = "test"
      }
    }
  }
