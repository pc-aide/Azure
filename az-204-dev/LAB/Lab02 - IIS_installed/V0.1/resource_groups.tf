resource "azurerm_resource_group" "rg_lab02" {
  name     = var.rg_name
  location = var.location
}

resource "azurerm_resource_group" "rg_networkwatcher" {
  name     = var.rg_nWatcher
  location = var.location
}
