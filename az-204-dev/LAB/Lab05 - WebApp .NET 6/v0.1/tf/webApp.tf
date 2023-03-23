# random web app name (unique & avaialbe)
resource "random_string" "ran_webApp_name" {
  length  = 8
  special = false
}

# service plan
resource "azurerm_service_plan" "svc_plan" {
  name                = var.svc_plan
  location            = var.location
  resource_group_name = var.rg_lab_name
  os_type             = "Windows"
  sku_name            = "B1"

  depends_on = [
    azurerm_resource_group.rg_lab
  ]
}

# web app
resource "azurerm_windows_web_app" "win_web_app" {
  # name : prefix (vars.tf) + suffix 
  name                = "${var.prefix_webApp_name}-${random_string.ran_webApp_name.result}"
  location            = var.location
  resource_group_name = var.rg_lab_name
  service_plan_id     = azurerm_service_plan.svc_plan.id

  depends_on = [
    azurerm_resource_group.rg_lab
  ]

  # code
  site_config {
    application_stack {
      current_stack  = "dotnetcore"
      dotnet_version = "v6.0"
    }
  }
}
