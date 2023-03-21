# resource group
variable "rg_lab" {
  type    = string
  default = "rg-lab04"
}

# resource group
variable "rg_netWorkWatcher" {
  type    = string
  default = "NetworkWatcherRG"
}

# location
variable "location" {
  type    = string
  default = "canadacentral"
}

# vnet
variable "cidr_space" {
  type    = list(string)
  default = ["10.56.0.0/16"]
}

variable "cidr_name" {
  type    = string
  default = "vnet-lab"
}

# subnet
variable "subnet_prefixes" {
  type    = list(string)
  default = ["10.56.0.0/24"]
}

variable "subnet_name" {
  type    = list(string)
  default = ["sub_10_56_0_0_24"]
}

# public IP (pip)
variable "pip_name" {
  type    = string
  default = "vm-pip"
}

# nic
variable "nic_name" {
  type    = string
  default = "vm-nic"
}

# nsg
variable "nsg_name" {
  type    = string
  default = "nsg-nic"
}

# security rule
variable "sec_rul_ssh" {
  type    = string
  default = "AllowSSHInbound"
}

# security rule
variable "sec_rul_http" {
  type    = string
  default = "AllowHTTPInbound"
}

# network watcher default
variable "net_wat_default" {
  type    = string
  default = "NetworkWatcher"
}

# vm name
variable "vm_name" {
  type    = string
  default = "vm-ubu"
}

# vm size
variable "vm_size" {
  type = string
  # 
  default = "Standard_DS1_v2"
}

# os disk
variable "os_disk" {
  type    = string
  default = "Standard_LRS"
}

# image
variable "ima_pub" {
  type        = string
  default     = "Canonical"
  description = "publisher"
}

variable "ima_off" {
  type        = string
  default     = "UbuntuServer"
  description = "offer"
}

variable "ima_sku" {
  type        = string
  default     = "18.04-LTS"
  description = "OS version"
}

variable "ima_ver" {
  type    = string
  default = "latest"
}

# creds
variable "adm_usr" {
  type    = string
  default = "paul"
}

variable "adm_pwd" {
  type      = string
  sensitive = true
}
