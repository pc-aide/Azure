variable "rg_name" {
  type    = string
  default = "rg-lab07"
}

variable "location" {
  type    = string
  default = "canadacentral"
}

# Storage Account
variable "sto_acc_name" {
  type    = string
  default = "salab07"

  validation {
    condition = (
      length(var.sto_acc_name) >= 3 &&
      length(var.sto_acc_name) <= 24 &&
      can(regex("^[a-z0-9]+$", var.sto_acc_name))
    )
    error_message = "The storage account name can only consist of lowercase letters and numbers, and must be between 3 and 24 characters long."
  }
}

variable "sto_acc_tie" {
  type    = string
  default = "Standard"
}

variable "sto_acc_rep" {
  type    = string
  default = "LRS"
}

#  service plan
variable "svc_pla_name" {
  type    = string
  default = "svc-pla-lab07"
}

variable "svc_pla_os" {
  type    = string
  default = "Windows"
}

variable "svc_pla_sku" {
  type    = string
  default = "S1"
}

# Function app
variable "fun_app_nam" {
  type    = string
  default = "fun"
}

variable "fun_app_ver" {
  type    = string
  default = "~6"
}

variable "fun_app_os" {
  type    = string
  default = "windows"
}

variable "fun_app_dot_ver" {
  type    = string
  default = "6"
}

# app insight
variable "app_ins_name" {
  type    = string
  default = "app-insights"
}

variable "app_ins_typ" {
  type    = string
  default = "web"
}

# funApp function
variable "appFun_fun_name" {
  type    = string
  default = "httpTrigger"
}
