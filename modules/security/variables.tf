# Name of the Resource Group in which all networking resources will be created
# This allows the module to deploy into an existing resource group
variable "resource_group_name" {}

# Name of the Network Security Group (NSG)
# NSGs control traffic rules (like allowing SSH or HTTP)
variable "nsg_name" {}

# Azure region where the resources (VNet, NSG, etc.) will be deployed
# Must be passed from the top-level module (e.g., "East US", "West Europe")
variable "location" {}

variable "ssh_source_ip" {
  description = "IP address range allowed to SSH (e.g., your home IP)"
  type        = string
}


variable "nic_id" {
  description = "The ID of the NIC to associate with the NSG"
  type        = string
}

