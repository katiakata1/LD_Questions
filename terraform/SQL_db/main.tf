# Define SQL Server
resource "azurerm_sql_server" "sql_server" {
  name                         = var.sql_server_name
  resource_group_name          = var.rg_name
  location                     = var.location
  version                      = var.sql_server_version
  administrator_login          = var.administrator_login
  administrator_login_password = var.administrator_login_password
}

# Define SQL Database
resource "azurerm_sql_database" "sql_db" {
  name                = var.sql_db_name
  resource_group_name = var.rg_name
  location            = var.location
  server_name         = azurerm_sql_server.sql_server.name
  edition             = var.db_edition
  collation           = var.db_collation
  auto_pause_delay    = var.db_auto_pause_delay
  min_capacity        = var.db_min_capacity
  max_capacity        = var.db_max_capacity
}