terraform {
  backend "azurerm" {
    resource_group_name  = "rg-be-clm-x"
    storage_account_name = "sabeclmr3d39t1d"
    container_name       = "scbeclm"
    key                  = "actiontest1" # NB! Endre for hver konfig!
  }
}
