resource "azurerm_mysql_flexible_server" "mgm-db-server" {
  name                   = "sistema-mgm-db-server"
  resource_group_name    = azurerm_resource_group.mgm-rg.name
  location               = azurerm_resource_group.mgm-rg.location
  administrator_login    = "superadmindb3000"
  administrator_password = "H@Sh1CoR3!"
  sku_name               = "B_Standard_B1s"
  version                = "8.0.21"
}

resource "azurerm_mysql_flexible_database" "mgm-db" {
  name                = "mgm-db"
  resource_group_name = azurerm_resource_group.mgm-rg.name
  server_name         = azurerm_mysql_flexible_server.mgm-db-server.name
  charset             = "utf8mb3"
  collation           = "utf8mb3_unicode_ci"
}