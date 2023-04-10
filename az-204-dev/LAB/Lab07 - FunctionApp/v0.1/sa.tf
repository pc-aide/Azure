resource "azurerm_storage_account" "sto_acc" {
  # SA have to a unique name & available
  name                     = "${var.sto_acc_name}${random_string.uni_nam.result}"
  resource_group_name      = azurerm_resource_group.rg_lab.name
  location                 = var.location
  account_tier             = var.sto_acc_tie
  account_replication_type = var.sto_acc_rep
}
