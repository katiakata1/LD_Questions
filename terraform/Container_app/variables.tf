variable "rg_name" {}
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

# Scalling
variable "min_app_replica" {}
variable "max_app_replica" {}

variable "app_rule_name_scale_up" {}
variable "app_rule_type" {}
variable "app_scale_up_rule_type" {}
variable "app_scale_up_rule_value" {}

variable "app_rule_name_scale_down" {}
variable "app_scale_down_rule_type" {}
variable "app_scale_down_rule_value" {}