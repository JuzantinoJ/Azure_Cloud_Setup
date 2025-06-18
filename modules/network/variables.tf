# Azure region where the resources (VNet, NSG, etc.) will be deployed
# Must be passed from the top-level module (e.g., "East US", "West Europe")
variable "location" {}

# Name of the Virtual Network (VNet)
# e.g., "dev-vnet"
variable "vnet_name" {}

# Address space for the VNet
# e.g., ["10.0.0.0/16"]
variable "vnet_address_space" {}

# Name of the Subnet inside the VNet
# e.g., "web-subnet"
variable "subnet_name" {}

# Address prefix for the Subnet
# e.g., ["10.0.1.0/24"]
variable "subnet_address_prefixes" {}

# Name for the public IP address assigned to the VM
# Needed to expose the VM to the internet (if desired)
variable "public_ip_name" {}

# Name of the Network Interface (NIC) that connects the VM to the VNet
# The NIC is what actually binds the VM to the subnet and IP
variable "nic_name" {}

# Name of the Resource Group in which all networking resources will be created
# This allows the module to deploy into an existing resource group
variable "resource_group_name" {}

