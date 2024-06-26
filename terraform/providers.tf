terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">=3.0.0"
    }
  }
}

# Configure the Microsoft Azure Provider
provider "azurerm" {
  features {}
  subscription_id = var.subscription_id
  client_id       = var.client_id
  client_secret   = var.client_secret
  tenant_id       = var.tenant_id
}

// Remote tf state
terraform {
  backend "azurerm" {
    resource_group_name   = "LD_rg"
    storage_account_name  = "ldquestionstfstatesa"
    container_name        = "tfstate"
    key                   = "tfstate"
  }
}













