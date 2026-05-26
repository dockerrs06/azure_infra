# =========================
# Resource Group
# =========================
resource "azurerm_resource_group" "rg" {
  name     = "isac-${var.env}-rg"
  location = var.location
}

# =========================
# AKS MODULE
# =========================
module "aks" {
  source = "./modules/kubernetes"

  count = var.enable_aks ? 1 : 0

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

# =========================
# VM MODULE
# =========================
module "windows_vm" {
  source = "./modules/virtualmachine"

  count = var.enable_vm ? 1 : 0

  env                 = var.env
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  vm_name             = var.vm_name
  admin_username      = var.admin_username
  admin_password      = var.admin_password
}
