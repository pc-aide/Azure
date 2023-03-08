resource "azurerm_resource_group" "rg_lab" {
  name     = var.rg_lab
  location = var.location
}

resource "azurerm_resource_group" "rg_networkwatcher" {
  name     = var.rg_nWatcher
  location = var.location
}
