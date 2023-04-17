resource "random_string" "uni_nam" {
  length  = 8
  special = false
  upper   = false
}

resource "azurerm_windows_function_app" "win_fun_app" {
  # fun. have to a unique name & available
  name                = "${var.fun_app_nam}-${random_string.uni_nam.result}"
  resource_group_name = azurerm_resource_group.rg_lab.name
  location            = var.location

  storage_account_name       = azurerm_storage_account.sto_acc.name
  storage_account_access_key = azurerm_storage_account.sto_acc.primary_access_key
  service_plan_id            = azurerm_service_plan.svc_pla.id

  site_config {
    application_stack {
      dotnet_version = var.fun_app_dot_ver
    }
  }

  app_settings = {
    "APPINSIGHTS_INSTRUMENTATIONKEY" = "azurerm_application_insights.app_ins.instrumentation_key"
  }

  depends_on = [
    azurerm_application_insights.app_ins
  ]
}
