resource "azurerm_network_security_group" "nsg_nic" {
  name                = var.nsg_vm
  location            = var.location
  resource_group_name = var.rg_name

  # Rules
  # RDP
  security_rule {
    name                       = var.sec_rule_name_rdp
    access                     = "Allow"
    description                = "Allow RDP Inbound"
    direction                  = "Inbound"
    protocol                   = "Tcp"
    destination_address_prefix = "*"
    destination_port_range     = "3389"
    priority                   = 100
    source_address_prefix      = var.src_address_prefix
    source_port_range          = "*"
  }

  # HTTP
  security_rule {
    name                       = var.sec_rule_name_http
    access                     = "Allow"
    description                = "Allow HTTP Inbound"
    direction                  = "Inbound"
    protocol                   = "Tcp"
    destination_address_prefix = "*"
    destination_port_range     = "80"
    priority                   = 110
    source_address_prefix      = "*"
    source_port_range          = "*"
  }

  depends_on = [
    azurerm_resource_group.rg_lab02
  ]
}
