resource "azurerm_service_plan" "svc_pla" {
  name                = var.svc_pla_name
  resource_group_name = azurerm_resource_group.rg_lab.name
  location            = var.location
  os_type             = var.svc_pla_os
  sku_name            = var.svc_pla_sku
}
