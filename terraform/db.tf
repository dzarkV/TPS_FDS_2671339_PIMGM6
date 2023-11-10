resource "azurerm_mysql_flexible_server" "mgm-db-server" {
  name                   = "${var.prefix}-db-server"
  resource_group_name    = azurerm_resource_group.mgm-rg.name
  location               = azurerm_resource_group.mgm-rg.location
  administrator_login    = var.db_username
  administrator_password = var.db_password
  sku_name               = "B_Standard_B1s"
  version                = "8.0.21"

  lifecycle {
    ignore_changes = [zone]
  }
}

resource "azurerm_mysql_flexible_database" "mgm-db" {
  name                = "${var.prefix}-db"
  resource_group_name = azurerm_resource_group.mgm-rg.name
  server_name         = azurerm_mysql_flexible_server.mgm-db-server.name
  charset             = "utf8mb3"
  collation           = "utf8mb3_unicode_ci"
}