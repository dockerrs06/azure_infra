terraform {

  backend "azurerm" {
    resource_group_name  = "tfstate-rg"
    storage_account_name = "isactfstateprod"
    container_name       = "tfstate"
    key                  = "dev.tfstate"
  }

}
