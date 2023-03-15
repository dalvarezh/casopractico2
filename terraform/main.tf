terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.42.0"
    }
  }
  required_version = ">= 1.4.0"
}

provider "azurerm" {
  features {
    resource_group {
      # Destuir aunque haya recursos, más control sobre terraform
      prevent_deletion_if_contains_resources = false
    }
    key_vault {
      purge_soft_deleted_keys_on_destroy = true
      recover_soft_deleted_keys          = true
    }
  }
}
