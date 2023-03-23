variable "rg_lab_name" {
  type    = string
  default = "rg-lab05"
}

variable "location" {
  type    = string
  default = "canadacentral"
}

# service plan name
variable "svc_plan" {
  type    = string
  default = "plan-webapp"
}

# prefix web app
variable "prefix_webApp_name" {
  type    = string
  default = "webApp-"
}
