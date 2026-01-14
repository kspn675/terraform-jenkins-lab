terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.0"
    }
  }

  backend "azurerm" {
    resource_group_name  = "tfstate-terraform-adi"
    storage_account_name = "tfstorageadi"
    container_name       = "adicontainerterraform-state"
    key                  = "adi-jenkins-demo.tfstate"
  }
}

provider "azurerm" {
  features {}
}
resource "azurerm_resource_group" "rg" {
  name     = "adi-JenkinsTerraformRG"
  location = "West US"
}

resource "azurerm_virtual_network" "vnet" {
  name                = "adi-JenkinsVNet"
  address_space       = ["10.10.0.0/16"]
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
}
