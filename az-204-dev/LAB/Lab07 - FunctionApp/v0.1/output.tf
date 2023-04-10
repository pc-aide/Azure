output "url_func" {
  value = "https://${azurerm_windows_function_app.win_fun_app.default_hostname}"
}
