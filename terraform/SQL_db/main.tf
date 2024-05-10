data "azurerm_resource_group" "rg" {
  name = var.rg_name  
}

# Define SQL Server
resource "azurerm_mssql_server" "sql_server" {
  name                         = var.sql_server_name
  resource_group_name          = data.azurerm_resource_group.rg.name
  location                     = data.azurerm_resource_group.rg.location
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

// Firewall rule allowing Container App to connect to DB
resource "azurerm_mssql_firewall_rule" "db_firewall_rule" {
  name             = var.db_firewall_rule_name
  server_id        = azurerm_mssql_server.sql_server.id
  start_ip_address = var.start_ip_address
  end_ip_address   = var.end_ip_address
}

