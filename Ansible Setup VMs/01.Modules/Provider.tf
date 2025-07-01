terraform {
  required_providers {
    azurerm = {
        source = "hashicorp/azurerm"
        version = "4.29.0"
    }
  }
  backend "azurerm" {
    resource_group_name = "Tushar_Backend"
    storage_account_name = "ppipestoragetu491"
    container_name = "ppipecontainer"
    key = "ansible.tfstate"
  }
}

provider "azurerm" {
  features { }
  subscription_id = "8f69ec30-4948-4da8-96ee-6d4c11740858"
}