resource "azurerm_service_plan" "mgm-sp" {
  name                = "${var.prefix}-service-plan"
  resource_group_name = azurerm_resource_group.mgm-rg.name
  location            = azurerm_resource_group.mgm-rg.location
  os_type             = "Linux"
  sku_name            = "F1"
}

resource "azurerm_linux_web_app" "mgm-users" {
  name                = "${var.prefix}-service-app-for-mgm-users"
  resource_group_name = azurerm_resource_group.mgm-rg.name
  location            = azurerm_resource_group.mgm-rg.location
  service_plan_id     = azurerm_service_plan.mgm-sp.id

  site_config {
    always_on = false
    application_stack {
      python_version = "3.9"
    }
  }
}

resource "azurerm_linux_web_app" "mgm-inventary" {
  name                = "${var.prefix}-service-app-for-mgm-inventary"
  resource_group_name = azurerm_resource_group.mgm-rg.name
  location            = azurerm_resource_group.mgm-rg.location
  service_plan_id     = azurerm_service_plan.mgm-sp.id

  site_config {
    ftps_state = "Disabled"
    always_on  = false
    application_stack {
      docker_image_name   = "dzarkv/inventorybe:v0.0.3"
      docker_registry_url = "https://index.docker.io"
    }
  }

  app_settings = {
    DB_HOST     = "jdbc:mysql://$${AZURE_MYSQL_HOST}:$${AZURE_MYSQL_PORT}/$${AZURE_MYSQL_DATABASE}"
    DB_PASSWORD = "$${AZURE_MYSQL_PASSWORD}"
    DB_USER     = "$${AZURE_MYSQL_USERNAME}"
  }

  lifecycle {
    ignore_changes = [
      site_config.0.application_stack
    ]
  }
}

  