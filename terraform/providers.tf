terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=3.0.0"
    }
  }
}

# Configure the Microsoft Azure Provider
provider "azurerm" {
  features {}
  subscription_id = "${{ secrets.AZURE_SUBSCRIPTION_ID }}"
  client_id       = "${{ secrets.AZURE_CLIENT_ID }}"
  client_secret   = "${{ secrets.AZURE_CLIENT_SECRET }}"
  tenant_id       = "${{ secrets.AZURE_TENANT_ID }}"
}






