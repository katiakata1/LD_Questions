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
    location = var.location
    sql_server_version = var.sql_server_version
    administrator_login = var.administrator_login
    administrator_login_password = var.administrator_login_password
    sql_db_name = var.sql_db_name
    db_edition = var.db_edition
    db_collation = var.db_collation
    db_auto_pause_delay = var.db_auto_pause_delay
    db_min_capacity = var.db_min_capacity
    db_max_capacity = var.db_max_capacity
}


