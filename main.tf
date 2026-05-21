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
resource "random_string" "rand" {
  length  = 4
  special = false
  upper   = false
}

resource "azurerm_storage_account" "sa" {
  for_each = toset(var.storage_list)

  name                     = lower("isac${var.env}${each.value}${random_string.rand.result}")
  resource_group_name      = azurerm_resource_group.rg.name
  location                 = var.location
  account_tier             = "Standard"
  account_replication_type = "LRS"

  tags = {
    environment = var.env
    type        = each.value
  }
}

# ----------------------------
# VM MODULE
# ----------------------------

module "windows_vm" {
  source = "./modules/virtualmachine"

  for_each = toset(var.vm_list)

  env                 = var.env
  resource_group_name = azurerm_resource_group.rg.name
  location            = var.location

  vm_name        = each.value
  admin_username = var.admin_username
  admin_password = var.admin_password
}

