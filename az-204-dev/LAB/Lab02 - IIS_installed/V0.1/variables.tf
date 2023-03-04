# resource group
variable "rg_name" {
  type    = string
  default = "rg-lab02"
}

# resource group
variable "rg_nWatcher" {
  type    = string
  default = "NetworkWatcherRG"

}

# location
variable "location" {
  type    = string
  default = "canadacentral"
}

variable "cidr_space" {
  type    = list(string)
  default = ["10.44.0.0/16"]
}

variable "cidr_name" {
  type    = string
  default = "vnet-srv"
}

variable "subnet_prefixes" {
  type    = list(string)
  default = ["10.44.0.0/24"]
}

variable "subnet_names" {
  type    = list(string)
  default = ["sub_10_44_0_0_24"]
}

# network security group
variable "nsg_vm" {
  type    = string
  default = "nsg-nic-vm-srv"
}

variable "sec_rule_name_rdp" {
  type    = string
  default = "AllowRDPInbound"
}

variable "sec_rule_name_http" {
  type    = string
  default = "AllowHTTPInbound"
}

variable "pip_name" {
  type    = string
  default = "vm-pip"
}

variable "vm_name" {
  type    = string
  default = "vm-srv"
}

variable "nic_name" {
  type    = string
  default = "vm-nic"
}

variable "src_address_prefix" {
  type        = string
  description = "Put your ISP for the access RDP"
}

# vm size
variable "vm_size" {
  # Standard_DS3_v2 - no hypervisor
  # Standard_D2s_v3 - yes hypervisor because "s"
  type    = string
  default = "Standard_D2s_v3"
}

variable "admin_username" {
  type    = string
  default = "paul"
}

variable "admin_password" {
  type      = string
  sensitive = true
}

variable "disk_name" {
  type    = string
  default = "vm-disk"
}

variable "vm_extension" {
  type    = string
  default = "vm-extension"
}
