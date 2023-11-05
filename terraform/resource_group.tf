resource "azurerm_resource_group" "mgm-rg" {
  name     = "sistema-mgm-rg"
  location = "eastus"
  tags = {
    environment = "dev"
    use         = "test"
  }
}
