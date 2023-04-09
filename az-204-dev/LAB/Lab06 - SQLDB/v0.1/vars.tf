variable "rg_name" {
  type    = string
  default = "rg-lab06"
}

variable "location" {
  type    = string
  default = "canadacentral"
}

# must have a name unique & available
# *.database.windows.net
variable "sql_svr_name" {
  type    = string
  default = "sql-svr-lab05"
}

variable "sql_srv_adm" {
  type        = string
  default     = "sqladmin"
  description = "admin_login"
  sensitive   = true
}

variable "sql_srv_pwd" {
  type        = string
  description = "adm_pwd"
  sensitive   = true

  validation {
    condition     = length(var.sql_srv_pwd) >= 8
    error_message = "Le pwd must be at least 8 characters in length"
  }

  validation {
    condition     = length(regexall("[!@#$%^&*(),.?\":{}|<>]", var.sql_srv_pwd)) >= 3
    error_message = "pwd must containt characters from 3 specials"
  }
}

variable "sql_srv_ver" {
  type    = string
  default = "12.0"
}

variable "sql_db_name" {
  type    = string
  default = "app-db"
}

variable "sql_db_sku" {
  type    = string
  default = "Basic"
}

variable "sql_fw_rul_isp" {
  type    = string
  default = "AllowMyISP"
}

variable "sql_fw_rul_svc" {
  type    = string
  default = "AllowAzSvc"
}
