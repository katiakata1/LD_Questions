data "azurerm_resource_group" "rg" {
  name = var.rg_name  
}

resource "azurerm_log_analytics_workspace" "container_logs" {
  name                = var.container_logs_name
  location            = data.azurerm_resource_group.rg.location
  resource_group_name = data.azurerm_resource_group.rg.name
  sku                 = var.container_logs_sku
  retention_in_days   = 30
}

resource "azurerm_container_app_environment" "container_app_env" {
  name                       = var.container_app_env_name
  location                   = data.azurerm_resource_group.rg.location
  resource_group_name        = data.azurerm_resource_group.rg.name
  log_analytics_workspace_id = azurerm_log_analytics_workspace.container_logs.id
}

resource "azurerm_container_app" "container_app" {
  name                         = var.container_app_name
  container_app_environment_id = azurerm_container_app_environment.container_app_env.id
  resource_group_name          = data.azurerm_resource_group.rg.name
  revision_mode                = var.container_app_revision_mode

  template {
    container {
      name   = var.container_name
      image  = var.image_name
      cpu    = var.container_cpu
      memory = var.container_memory
    }

    min_replicas = var.min_app_replica
    max_replicas = var.max_app_replica

    custom_scale_rule {
      name = var.app_rule_name_scale_up
      custom_rule_type = var.app_rule_type
      metadata = {
        type = var.app_scale_up_rule_type
        value = var.app_scale_up_rule_value
      }
    }

    custom_scale_rule {
      name = var.app_rule_name_scale_down
      custom_rule_type = var.app_rule_type
      metadata = {
        type = var.app_scale_down_rule_type
        value = var.app_scale_down_rule_value
      }
    }
  }

  ingress {
    external_enabled = true
    target_port      = var.target_port
    transport        = "http"
    traffic_weight {
      latest_revision = true
      percentage      = 100
    }
  }
}

