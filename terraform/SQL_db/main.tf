# Define SQL Server
resource "azurerm_mssql_server" "sql_server" {
  name                         = var.sql_server_name
  resource_group_name          = var.rg_name
  location                     = var.location
  version                      = var.sql_server_version
  administrator_login          = var.administrator_login
  administrator_login_password = var.administrator_login_password
}

# Define SQL Database
resource "azurerm_mssql_database" "sql_db" {
  name                = var.sql_db_name
  resource_group_name = var.rg_name
  server_name         = azurerm_mssql_server.sql_server.name
  collation           = var.db_collation
}