module "vnet" {
  source  = "Azure/vnet/azurerm"
  version = "~>4.0.0"
  # insert the 3 required variables here
  # 1_3 - resource_group_name
  # 2_3 - use_for_each - bool
  # 3_3 - vnet_location - string

  # 
  use_for_each = true

  # resource group
  resource_group_name = var.rg_lab
  vnet_location       = var.location
  # vnet
  address_space = var.cidr_space
  vnet_name     = var.cidr_name
  # subnets
  subnet_prefixes = var.subnet_prefixes
  subnet_names    = var.subnet_name

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
  # DNS name
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

# network interface security group assoc
resource "azurerm_network_interface_security_group_association" "nic_sg_assoc" {
  network_security_group_id = azurerm_network_security_group.nsg_nic.id
  network_interface_id      = azurerm_network_interface.nic.id
}

# network watcher default
resource "azurerm_network_watcher" "nWatcher_default" {
  name                = var.net_wat_default
  location            = var.location
  resource_group_name = azurerm_resource_group.rg_networkwatcher.name
}
