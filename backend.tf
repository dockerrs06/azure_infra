terraform {

  backend "azurerm" {
    resource_group_name  = "isac-dev-rg"
    storage_account_name = "isactfstatedev"
    container_name       = "tfstate"
    key                  = "dev.tfstate"
  }

}
