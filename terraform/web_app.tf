resource "azurerm_service_plan" "mgm-sp" {
  name                = "mgm-service-plan"
  resource_group_name = azurerm_resource_group.mgm-rg.name
  location            = azurerm_resource_group.mgm-rg.location
  os_type             = "Linux"
  sku_name            = "F1"
}

resource "azurerm_linux_web_app" "mgm-users" {
  name                = "mgm-service-users"
  resource_group_name = azurerm_resource_group.mgm-rg.name
  location            = "eastus"
  service_plan_id     = azurerm_service_plan.mgm-sp.id

  site_config {
    application_stack {
      python_version = "3.9"
    }
  }
}

resource "azurerm_linux_web_app" "mgm-inventary" {
  name                = "mgm-service-inventary"
  resource_group_name = azurerm_resource_group.mgm-rg.name
  location            = "eastus"
  service_plan_id     = azurerm_service_plan.mgm-sp.id

  site_config {
     ftps_state        = "Disabled"

    application_stack {
     docker_image_name = "dzarkv/inventorybe:v0.0.2"
     docker_registry_url = "https://index.docker.io"
    }
  }
}

  