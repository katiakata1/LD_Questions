data "azurerm_resource_group" "rg" {
  name = var.rg_name  
}

resource "azurerm_application_insights" "app_insights" {
  name                = var.app_insights_name
  location            = data.azurerm_resource_group.rg.location
  resource_group_name = data.azurerm_resource_group.rg.name
  application_type    = "web"
}

