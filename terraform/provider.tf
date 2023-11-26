terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.79.0"
    }

    atlas = {
      source  = "ariga/atlas"
      version = "0.5.8"
    }
  }
  required_version = ">= 1.1.0"
}

# Configure the Microsoft Azure Provider
provider "azurerm" {
  skip_provider_registration = true
  features {
    resource_group {
      prevent_deletion_if_contains_resources = false
    }
  }
}

# Configure the Atlas Provider to manage Atlas schemas
provider "atlas" {
  dev_url = "docker://mysql/8/bbdd_inventario"
}