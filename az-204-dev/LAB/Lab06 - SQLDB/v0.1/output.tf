output "sql_srv_fqdn" {
  value = azurerm_mssql_server.sql_srv.fully_qualified_domain_name
}
