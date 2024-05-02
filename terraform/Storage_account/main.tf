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

resource "azurerm_storage_container" "tfstate_container" {
  name                  = var.tfstate_container_name
  storage_account_name  = azurerm_storage_account.tfstate_sa.name
  container_access_type = "private"  # Specify the access level for the container
}