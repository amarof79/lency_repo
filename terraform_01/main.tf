terraform {
  required_providers {
    azurerm = {
        source = "hashicorp/azurerm"
        version = "=3.31.0"
    }
  }
}

provider "azurerm" {
    features {}
}

resource "azurerm_resource_group" "rg1"{
    name = "Terraform_Resource_Group"
    location = "East US"
}

data "azurerm_resource_group" "testing"{
    resource_group_name = "testRG"
}

