# ----------------------------
# Resource Group
# ----------------------------
resource "azurerm_resource_group" "rg" {
  name     = "isac-${var.env}-rg"
  location = var.location
}

# ----------------------------
# Random
# ----------------------------
resource "random_string" "rand" {
  for_each = var.storage_config

  length  = 4
  special = false
  upper   = false
}

# ----------------------------
# Storage Accounts ✅ FIXED
# ----------------------------
resource "azurerm_storage_account" "sa" {
  for_each = var.storage_config

  name                     = lower("isac${var.env}${each.key}${random_string.rand[each.key].result}")
  resource_group_name      = azurerm_resource_group.rg.name
  location                 = var.location

  account_tier             = "Standard"
  account_replication_type = each.value.replication_type  # ✅ FIXED

  tags = {
    environment = var.env
    type        = each.key
  }
}

# ----------------------------
# VM MODULE ✅ FIXED
# ----------------------------
module "windows_vm" {
  source = "./modules/virtualmachine"

  for_each = var.vm_config

  env                 = var.env
  resource_group_name = azurerm_resource_group.rg.name
  location            = var.location

  vm_name = each.key
  vm_size = each.value.size

  admin_username = var.admin_username
  admin_password = var.admin_password
}
