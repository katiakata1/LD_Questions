data "azurerm_resource_group" "rg" {
  name = var.rg_name  
}

# Define SQL Server
resource "azurerm_mssql_server" "sql_server" {
  name                         = var.sql_server_name
  resource_group_name          = azurerm_resource_group.rg.name
  location                     = azurerm_resource_group.rg.location
  version                      = var.sql_server_version
  administrator_login          = var.administrator_login
  administrator_login_password = var.administrator_login_password
}

# Define SQL Database
resource "azurerm_mssql_database" "sql_db" {
  name                = var.sql_db_name
  server_id        = azurerm_mssql_server.sql_server.id
  collation           = var.db_collation
}