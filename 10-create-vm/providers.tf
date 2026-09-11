terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.0"
    }
  }
}

terraform {
  backend "azurerm" {
    resource_group_name  = "rg-tfstate-eus"
    storage_account_name = "stschaladi95tfstate"
    container_name       = "computetfstate"
    key                  = "compute.tfstate"

    use_azuread_auth = true
    use_oidc         = true
  }
}


provider "azurerm" {
  features {}
}
