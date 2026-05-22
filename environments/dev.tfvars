



env            = "dev"
location       = "Central India"

admin_username = "azureadmin"
admin_password = "P@ssword12345!"

vm_config = {
  app = { size = "Standard_B2s" }
  db  = { size = "Standard_B2s" }
}

storage_config = {
  logs   = "Standard_LRS"
  backup = "Standard_LRS"
}
