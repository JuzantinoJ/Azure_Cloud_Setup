# Azure Provider source and version being used
terraform {
  required_providers {
    azurerm = {
        source = "hashicorp/azurerm"
        version = "4.33.0"
    }
  }
}

# Configure the Microsoft Azure Provider
provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "rg" {
  name     = "dev-web-rg-eastus"
  location = var.location
}

module "network" {
  source                = "./modules/network"
  location              = var.location
  resource_group_name   = azurerm_resource_group.rg.name

  vnet_name             = "dev-web-vnet"
  vnet_address_space    = ["10.0.0.0/16"]

  subnet_name           = "dev-web-subnet"
  subnet_address_prefixes = ["10.0.2.0/24"]

  nsg_name              = "dev-web-nsg"
  public_ip_name        = "dev-web-pip"
  nic_name              = "dev-web-nic"
}

module "compute" {
  source              = "./modules/compute"
  location            = var.location
  resource_group_name = azurerm_resource_group.rg.name

  vm_name             = "dev-web-vm"
  nic_id              = module.network.nic_id
  admin_username      = "azureuser"
  public_key_path     = "~/.ssh/id_rsa.pub"
  vm_size             = "Standard_B1s"
}
