resource "azurerm_resource_group" "mgm-rg" {
  name     = "${var.prefix}-rg"
  location = var.resource_group_location
  tags = {
    environment = "dev"
    use         = "test"
  }
}
