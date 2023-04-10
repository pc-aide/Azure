#####################################################
# TERRAFORM
#####################################################

terraform {
  required_version = "~>1.4.0"
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~>3.19.0"
    }
  }
}

#####################################################
# PROVIDERS
#####################################################

provider "azurerm" {
  features {
    resource_group {
      prevent_deletion_if_contains_resources = false
    }
  }
  # skip_provider_registration = true
}
