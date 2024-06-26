module "vnet" {
  source  = "Azure/vnet/azurerm"
  version = "~>2.7.0"

  resource_group_name = var.rg_lab
  # vnet
  address_space = var.cidr_space
  vnet_name     = var.cidr_name
  # subnets
  subnet_prefixes = var.subnet_prefixes
  subnet_names    = var.subnet_names

  depends_on = [
    azurerm_resource_group.rg_lab
  ]
}

# vm-pip
resource "azurerm_public_ip" "pip" {
  name                = var.pip_name
  resource_group_name = var.rg_lab
  location            = var.location
  allocation_method   = "Dynamic"
  # dns name
  domain_name_label = var.vm_name

  depends_on = [
    azurerm_resource_group.rg_lab
  ]
}

# vm-nic
resource "azurerm_network_interface" "nic" {
  name                = var.nic_name
  resource_group_name = var.rg_lab
  location            = var.location

  ip_configuration {
    name                          = "external"
    subnet_id                     = module.vnet.vnet_subnets[0]
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.pip.id
  }
}

# nic-sg-association
resource "azurerm_network_interface_security_group_association" "nic_sg_asso" {
  network_security_group_id = azurerm_network_security_group.nsg_nic.id
  network_interface_id      = azurerm_network_interface.nic.id
}

# network watcher default
resource "azurerm_network_watcher" "nWatcher_default" {
  name                = "NetworkWatcher"
  location            = var.location
  resource_group_name = azurerm_resource_group.rg_networkwatcher.name
}
