variable "location" {}
variable "resource_group_name" {}

# Network module inputs
variable "vnet_name" {}
variable "vnet_address_space" {}
variable "subnet_name" {}
variable "subnet_address_prefixes" {}
variable "nsg_name" {}
variable "public_ip_name" {}
variable "nic_name" {}

# Compute module inputs
variable "vm_name" {}
variable "admin_username" {}
variable "public_key_path" {}
variable "vm_size" {}
