


env            = "itg"
location       = "Central India"

admin_username = "azureadmin"
admin_password = "P@ssword12345!"

vm_config = {
  app   = { size = "Standard_B4ms" }
  db    = { size = "Standard_B8ms" }
  cache = { size = "Standard_B2s" }
}

storage_config = {
  logs       = "Standard_LRS"
  backup     = "Standard_GRS"
  analytics  = "Standard_LRS"
}
