

# ----------------------------
# Resource Group
# ----------------------------
resource "azurerm_resource_group" "rg" {
  name     = "isac-${var.env}-rg"
  location = var.location
}

# ----------------------------
# Storage Account
# ----------------------------
resource "azurerm_storage_account" "sa" {
  name                     = lower("isac${var.env}sa${random_string.rand.result}")
  resource_group_name      = azurerm_resource_group.rg.name
  location                 = azurerm_resource_group.rg.location
  account_tier             = "Standard"
  account_replication_type = "LRS"

  tags = {
    environment = var.env
  }
}

# Random for unique SA name
resource "random_string" "rand" {
  length  = 4
  special = false
  upper   = false
}







module "windows_vm" {
  source = "./modules/virtualmachine"

  resource_group_name = var.resource_group_name
  location            = var.location
  vm_name             = var.vm_name
  admin_username      = var.admin_username
  admin_password      = var.admin_password
}
