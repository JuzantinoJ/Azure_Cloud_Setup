
# Create a Linux Virtual Machine (VM) in Azure
resource "azurerm_linux_virtual_machine" "vm" {
  name                  = var.vm_name
  location              = var.location
  resource_group_name   = var.resource_group_name
  size                  = var.vm_size
  admin_username        = var.admin_username

  # Attach the VM to a network interface (NIC)
  network_interface_ids = [var.nic_id]

 # SSH key authentication (no password login)
  admin_ssh_key {
    username   = var.admin_username
    public_key = file(var.public_key_path)
  }

  disable_password_authentication = true

  # Configure the OS disk
  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  # Define the Linux image to use (Ubuntu 22.04 LTS)
  source_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-jammy"
    sku       = "22_04-lts"
    version   = "latest"
  }
}
