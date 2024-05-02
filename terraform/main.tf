// Creating RG
resource "azurerm_resource_group" "rg" {
  name     = var.rg_name
  location = var.location
}

// Deploying SQL
module "sql" {
    source = "./SQL_db"
    sql_server_name = var.sql_server_name
    rg_name = var.rg_name
    sql_server_version = var.sql_server_version
    administrator_login = var.administrator_login
    administrator_login_password = var.administrator_login_password
    sql_db_name = var.sql_db_name
    db_collation = var.db_collation
}


