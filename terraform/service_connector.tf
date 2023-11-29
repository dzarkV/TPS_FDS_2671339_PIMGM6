resource "azurerm_app_service_connection" "mgm-inventary-to-mysql-sc" {
  name               = "inventary_webapp_to_mysql_sc"
  app_service_id     = azurerm_linux_web_app.mgm-inventary.id
  target_resource_id = azurerm_mysql_flexible_database.mgm-db.id
  authentication {
    type   = "secret"
    name   = azurerm_mysql_flexible_server.mgm-db-server.administrator_login
    secret = azurerm_mysql_flexible_server.mgm-db-server.administrator_password
  }
}
