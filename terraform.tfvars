# Global settings
location            = "East US"
resource_group_name = "dev-web-rg-eastus"

# Network config
vnet_name               = "dev-web-vnet"
vnet_address_space      = ["10.0.0.0/16"]
subnet_name             = "dev-web-subnet"
subnet_address_prefixes = ["10.0.2.0/24"]
nsg_name                = "dev-web-nsg"
public_ip_name          = "dev-web-pip"
nic_name                = "dev-web-nic"

# Compute config
vm_name         = "dev-web-vm"
admin_username  = "azureuser"
public_key_path = "~/.ssh/id_rsa.pub"
vm_size         = "Standard_B1s"
