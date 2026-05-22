env      = "itg"
location = "Central India"

admin_username = "azureadmin"
admin_password = "P@ssword12345!"

# ✅ 4 Virtual Machines
vm_config = {
  app1 = {
    size = "Standard_B2s"
  }
  app2 = {
    size = "Standard_B2s"
  }
  db1 = {
    size = "Standard_B2s"
  }
  cache1 = {
    size = "Standard_B2s"
  }
}

# ✅ 4 Storage Accounts
storage_config = {
  logs = {
    replication_type = "LRS"
  }
  backup = {
    replication_type = "LRS"
  }
  archive = {
    replication_type = "GRS"
  }
  analytics = {
    replication_type = "LRS"
  }
}
