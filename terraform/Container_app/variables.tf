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
variable "app_rule_metric" {}
variable "app_rule_scale_up_operator" {}
variable "app_rule_scale_up_threshold" {}
variable "app_rule_scale_up_direction" {}
variable "app_rule_scale_up_cooldown" {}

variable "app_rule_name_scale_down" {}
variable "app_rule_scale_down_operator" {}
variable "app_rule_scale_down_threshold" {}
variable "app_rule_scale_down_direction" {}
variable "app_rule_scale_down_cooldown" {}