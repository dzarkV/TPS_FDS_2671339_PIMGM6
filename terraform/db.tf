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

resource "azurerm_mysql_flexible_server_configuration" "disable_tls" {
  name                = "require_secure_transport"
  server_name         = azurerm_mysql_flexible_server.mgm-db-server.name
  resource_group_name = azurerm_resource_group.mgm-rg.name
  value               = "off"
}

data "atlas_schema" "mgm-db-schema" {
  src = "file://../assets/docs/trim2/4_bbdd/inventarioScript-schema-v2.sql"
}

resource "atlas_schema" "mgm-db-schema" {
  url = "mysql://${azurerm_mysql_flexible_server.mgm-db-server.administrator_login}:${azurerm_mysql_flexible_server.mgm-db-server.administrator_password}@${azurerm_mysql_flexible_server.mgm-db-server.fqdn}"
  hcl = data.atlas_schema.mgm-db-schema.hcl
}