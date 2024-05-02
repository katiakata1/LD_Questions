data "azurerm_resource_group" "rg" {
  name = var.rg_name  
}

resource "azurerm_storage_account" "tfstate_sa" {
  name                     = var.tfstate_sa_name
  resource_group_name      = data.azurerm_resource_group.rg.name
  location                 = data.azurerm_resource_group.rg.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}