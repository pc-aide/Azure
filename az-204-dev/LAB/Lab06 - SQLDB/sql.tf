resource "random_string" "ran_sql_srv_name_pre" {
  length  = 6
  special = false
}

resource "azurerm_mssql_server" "sql_srv" {
  name                         = var.sql_svr_name
  resource_group_name          = azurerm_resource_group.rg_lab.name
  location                     = var.location
  administrator_login          = var.sql_srv_adm
  administrator_login_password = var.sql_srv_pwd
  # where is in the Create SQL db GUI ?
  version = var.sql_srv_ver
}

resource "azurerm_mssql_database" "sql_db" {
  name      = var.sql_db_name
  server_id = azurerm_mssql_server.sql_srv.id
  sku_name  = var.sql_db_sku
}
