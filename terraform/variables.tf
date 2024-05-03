variable "rg_name" {
    type = string
}

variable "location" {
    type = string
}

variable "subscription_id" {}
variable "client_id" {}
variable "client_secret" {}
variable "tenant_id" {}

variable "tfstate_sa_name" {}
variable "tfstate_container_name" {}

// SQL Variables
variable "sql_server_name" {}
variable "sql_server_version" {}
variable "administrator_login" {}
variable "administrator_login_password" {}
variable "sql_db_name" {}
variable "db_collation" {}
