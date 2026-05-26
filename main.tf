# =========================
# Resource Group
# =========================
resource "azurerm_resource_group" "rg" {
  name     = "isac-${var.env}-rg"
  location = var.location
}

# =========================
# Random String (Storage)
# =========================
resource "random_string" "rand" {
  length  = 4
  special = false
  upper   = false
}

# =========================
# Storage Account
# =========================
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

# =========================
# Virtual Machine Module
# =========================
module "windows_vm" {
  source = "./modules/virtualmachine"

  env                 = var.env
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  vm_name             = var.vm_name
  admin_username      = var.admin_username
  admin_password      = var.admin_password
}

# =========================
# AKS (Azure Kubernetes Service) Module
# =========================
module "aks" {
  source = "./modules/kubernetes"

  cluster_name        = "isac-${var.env}-aks"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  dns_prefix          = "isac-${var.env}-aks"

  node_pool_name = "default"
  node_count     = var.aks_node_count
  vm_size        = var.aks_vm_size

  tags = {
    environment = var.env
  }
}
