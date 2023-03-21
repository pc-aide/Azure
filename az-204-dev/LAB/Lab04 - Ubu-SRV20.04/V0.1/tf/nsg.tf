resource "azurerm_network_security_group" "nsg_nic" {
  name                = var.nsg_name
  location            = var.location
  resource_group_name = var.rg_lab

  # Rules
  # ssh
  security_rule {
    name                       = var.sec_rul_ssh
    access                     = "Allow"
    description                = "Allow SSH Inbound"
    destination_address_prefix = "*"
    destination_port_range     = "22"
    direction                  = "Inbound"
    priority                   = 100
    protocol                   = "Tcp"
    source_address_prefix      = data.http.ifconfigme.response_body
    source_port_range          = "*"
  }

  # http
  security_rule {
    name                       = var.sec_rul_http
    access                     = "Allow"
    description                = "Allow HTTP Inbound"
    destination_address_prefix = "*"
    destination_port_range     = "80"
    direction                  = "Inbound"
    priority                   = 110
    protocol                   = "Tcp"
    source_address_prefix      = "*"
    source_port_range          = "*"
  }

  depends_on = [
    azurerm_resource_group.rg_lab
  ]
}
