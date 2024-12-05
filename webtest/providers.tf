# "FORMALIA"
terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.9.0"
    }
  }

/*
provider "azurerm" {
  subscription_id = var.subId
  features {}
}
*/

    backend "azurerm" {
    resource_group_name  = "rg-be-clm-x"
    storage_account_name = "sabeclmr3d39t1d"
    container_name       = "scbeclm"
    key                  = "webtest1" # NB! Endre for hver konfig!
  }
}

provider "azurerm" {
  features {}
}
