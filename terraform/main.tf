// Creating RG
# resource "azurerm_resource_group" "rg" {
#   name     = var.rg_name
#   location = var.location
# }

// Creating Storage Account for tfstate
# module "tfstate_sa" {
#     source = "./Storage_account"
#     rg_name = var.rg_name
#     tfstate_sa_name = var.tfstate_sa_name
#     tfstate_container_name = var.tfstate_container_name
# }

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

// Deploying Container App
module "container_app" {
    source = "./Container_app"
    rg_name = var.rg_name
    container_logs_name = var.container_logs_name
    container_logs_sku = var.container_logs_sku
    container_app_env_name = var.container_app_env_name
    container_app_revision_mode = var.container_app_revision_mode
    container_app_name = var.container_app_name
    image_name = var.image_name
    container_cpu = var.container_cpu
    container_memory = var.container_memory
    container_name = var.container_name
    container_port = var.container_port
}




















