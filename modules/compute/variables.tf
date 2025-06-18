
# The name to assign to the virtual machine (VM)
# This will be used as the actual VM name in Azure
variable "vm_name" {}

# The Azure region where the VM should be deployed
# This must match the region of the resource group and network resources
variable "location" {}

# The name of the resource group where the VM will be deployed
# Should match the same resource group used by the network module
variable "resource_group_name" {}

# The ID of the network interface (NIC) to attach to the VM
# This connects the VM to the virtual network and subnet
variable "nic_id" {}

# The admin username for logging into the VM
# Used when creating the admin user account for SSH acces
variable "admin_username" {}

# The local file path to the SSH public key
# This key will be used to configure secure, key-based authentication on the VM
variable "public_key_path" {}

# The size of the VM to be provisioned
# Example: "Standard_B1s" for free tier, or larger sizes for more compute power
variable "vm_size" {}
