# tf = terraform
# Data source : Allow tf to use information defined outside of tf, defined by another separate tf configuration, or modified by functions
# find my ISP
data "http" "icanhazip" {
  url = "http://icanhazip.com"
}

resource "azurerm_network_security_group" "nsg_nic" {
  name                = var.nsg_vm
  location            = var.location
  resource_group_name = var.rg_lab

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
    # chomp, a function removes newline characters at the end of a string
    source_address_prefix = "${chomp(data.http.icanhazip.response_body)}/32"
    source_port_range     = "*"
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

  # IIS\management service
  security_rule {
    name                       = var.sec_rule_name_mgmtSvc
    access                     = "Allow"
    description                = "Allow Management Service Inbound"
    direction                  = "Inbound"
    protocol                   = "*"
    destination_address_prefix = "*"
    destination_port_range     = "8172"
    priority                   = 120
    source_address_prefix      = "*"
    source_port_range          = "*"
  }

  depends_on = [
    azurerm_resource_group.rg_lab
  ]
}
