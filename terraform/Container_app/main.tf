data "azurerm_resource_group" "rg" {
  name = var.rg_name  
}

resource "null_resource" "deploy_container_app" {
  provisioner "local-exec" {
    command = <<-EOT
      # Deploy Azure Container App using Azure CLI
      az container create --resource-group "${var.rg_name }" \
                          --name "${var.container_name}" \
                          --image "${var.image_name}" \
                          --cpu "${var.container_cpu}" \
                          --memory "${var.container_memory}" \
                          --dns-name-label "${var.container_name}-dns" \
                          --ports "${var.container_port}"
    EOT
  }
}






// FOR SOME REASON THESE RESOURCE TYPES ARE NOT OK
# resource "azurerm_log_analytics_workspace" "container_logs" {
#   name                = var.container_logs_name
#   location            = data.azurerm_resource_group.rg.location
#   resource_group_name = data.azurerm_resource_group.rg.name
#   sku                 = var.container_logs_sku
#   retention_in_days   = 30
# }

# resource "azurerm_container_app_environment" "container_app_env" {
#   name                       = var.container_app_env_name
#   location                   = data.azurerm_resource_group.rg.location
#   resource_group_name        = data.azurerm_resource_group.rg.name
#   log_analytics_workspace_id = azurerm_log_analytics_workspace.container_logs.id
# }
# resource "azurerm_container_app" "container_app" {
#   name                         = var.container_app_name
#   container_app_environment_id = azurerm_container_app_environment.container_app_env.id
#   resource_group_name          = data.azurerm_resource_group.rg.name
#   revision_mode                = var.container_app_revision_mode

#   template {
#     container {
#       name   = var.container_name
#       image  = var.image_name
#       cpu    = var.container_cpu
#       memory = var.container_memory
#     }
#   }
# }

