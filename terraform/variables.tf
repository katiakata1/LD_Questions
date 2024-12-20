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

variable "db_firewall_rule_name" {}

// Container App Variables
variable "container_logs_name" {}
variable "container_logs_sku" {}
variable "container_app_env_name" {}
variable "container_app_revision_mode" {}
variable "container_app_name" {}
variable "image_name" {}
variable "container_cpu" {}
variable "container_memory" {}
variable "container_name" {}

variable "container_port" {}
variable "container_ip" {}
variable "target_port" {}

# App Scalling
variable "min_app_replica" {}
variable "max_app_replica" {}
variable "app_rule_name_scale_up" {}
variable "app_rule_type" {}
variable "app_scale_up_rule_type" {}
variable "app_scale_up_rule_value" {}
variable "app_rule_name_scale_down" {}
variable "app_scale_down_rule_type" {}
variable "app_scale_down_rule_value" {}

variable "app_insights_name" {}