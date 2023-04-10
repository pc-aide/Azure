resource "azurerm_application_insights" "app_ins" {
  name                = var.app_ins_name
  location            = var.location
  resource_group_name = azurerm_resource_group.rg_lab.name
  application_type    = var.app_ins_typ
}
