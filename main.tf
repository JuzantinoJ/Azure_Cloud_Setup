# Azure Provider source and version being used
terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.33.0"
    }
  }
}

# Configure the Microsoft Azure Provider
provider "azurerm" {
  features {}
}

# Create a Resource Group in Azure to contain all resources
resource "azurerm_resource_group" "rg" {
  name     = var.resource_group_name
  location = var.location
}

# Call the network module to provision:
# - VNet, Subnet, NSG, Public IP, and NIC
module "network" {
  source                  = "./modules/network"
  location                = var.location
  resource_group_name     = var.resource_group_name

  vnet_name               = var.vnet_name
  vnet_address_space      = var.vnet_address_space

  subnet_name             = var.subnet_name
  subnet_address_prefixes = var.subnet_address_prefixes

  public_ip_name          = var.public_ip_name
  nic_name                = var.nic_name
}

# Call the compute module to provision:
# - A Linux VM with SSH key login
module "compute" {
  source              = "./modules/compute"
  location            = var.location
  resource_group_name = var.resource_group_name

  vm_name             = var.vm_name
  nic_id              = module.network.nic_id
  admin_username      = var.admin_username
  public_key_path     = var.public_key_path
  vm_size             = var.vm_size
}

module "security" {
  source              = "./modules/security"
  location            = var.location
  resource_group_name = var.resource_group_name
  nsg_name            = var.nsg_name
  ssh_source_ip       = var.ssh_source_ip
  nic_id              = module.network.nic_id
}
