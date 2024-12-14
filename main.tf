terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.14.0"
    }
  }
}

provider "azurerm" {
  features {}
  subscription_id = "02e52ae5-0d0d-453c-a3be-547122e9c912"
}

resource "azurerm_resource_group" "example" {
  name     = "my-terraform-rg"
  location = "eastus"
}

resource "azurerm_storage_account" "example" {
  name                     = "mystorageaccount0608"
  resource_group_name      = azurerm_resource_group.example.name
  location                 = azurerm_resource_group.example.location
  account_tier             = "Standard"
  account_replication_type = "GRS"

  tags = {
    environment = "staging"
  }
}
