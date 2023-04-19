output "url_func" {
  value = "https://${azurerm_windows_function_app.win_fun_app.default_hostname}"
}

output "sub_id" {
  value = data.azurerm_subscription.sub.subscription_id
}
