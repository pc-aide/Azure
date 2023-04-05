resource "azurerm_resource_group" "rg_lab" {
  name     = var.rg_name
  location = var.location
}
