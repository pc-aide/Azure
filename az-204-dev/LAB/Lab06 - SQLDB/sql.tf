resource "random_string" "ran_sql_srv_name_pre" {
  length  = 6
  special = false
}

# sql srv
resource "azurerm_mssql_server" "sql_srv" {
  name                         = var.sql_svr_name
  resource_group_name          = azurerm_resource_group.rg_lab.name
  location                     = var.location
  administrator_login          = var.sql_srv_adm
  administrator_login_password = var.sql_srv_pwd
  # where is in the Create SQL db GUI ?
  version = var.sql_srv_ver
}

# sql db
resource "azurerm_mssql_database" "sql_db" {
  name      = var.sql_db_name
  server_id = azurerm_mssql_server.sql_srv.id
  sku_name  = var.sql_db_sku
}

# sql fw rule : AllowMyISP
resource "azurerm_mssql_firewall_rule" "sql_fw_rul" {
  name             = var.sql_fw_rul_isp
  server_id        = azurerm_mssql_server.sql_srv.id
  start_ip_address = data.http.ipconfigme.response_body
  end_ip_address   = data.http.ipconfigme.response_body
}

# sql fw rule : Allow Azure services and resources to access this server
resource "azurerm_mssql_firewall_rule" "allow_az_svc" {
  name             = var.sql_fw_rul_svc
  server_id        = azurerm_mssql_server.sql_srv.id
  start_ip_address = "0.0.0.0"
  end_ip_address   = "0.0.0.0"
}
