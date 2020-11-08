terraform {
  required_version = ">= 0.13.5"
  required_providers {
    azuread = {
      source  = "hashicorp/azuread"
      version = "~>1.0.0"
    }
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~>2.34.0"
    }
  }
  backend "azurerm" {
     resource_group_name  = "tf_rg_blobstore"
    storage_account_name = "tfstorageaccskyflambe"
    container_name       = "tfstate"
    key                  = "customerexperience.terraform.tfstate"
  }
}