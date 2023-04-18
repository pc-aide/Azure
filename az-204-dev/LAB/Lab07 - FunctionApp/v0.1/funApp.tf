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


resource "azurerm_function_app_function" "httpTrigger" {
  name            = var.appFun_fun_name
  function_app_id = azurerm_windows_function_app.win_fun_app.id
  language        = "CSharp"

  # Changing this forces a new resource to be created
  # so can't use more that one file for contents different
  # e.g. readme.md & run.csx

  # workAround : upload_files
  file {
    name    = "run.csx"
    content = file("./run.csx")
  }

  config_json = jsonencode({
    "bindings" : [
      {
        "authLevel" : "function",
        "name" : "req",
        "type" : "httpTrigger",
        "direction" : "in",
        "methods" : [
          "get",
          "post"
        ]
      },
      {
        "name" : "$return",
        "type" : "http",
        "direction" : "out"
      }
    ]
  })
}

/* upload_files
    resource "null_resource" "upload_files" {
  provisioner "local-exec" {
    command = <<-EOT
      az functionapp deployment source config-zip \
        --src ./function_files.zip \
        --name ${azurerm_function_app_function.example.name} \
        --resource-group ${azurerm_function_app_function.example.resource_group_name}
    EOT
  }

  triggers = {
    function_app_id = azurerm_function_app_function.example.id
  }
  */
