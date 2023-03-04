# vm
resource "azurerm_windows_virtual_machine" "vm_terraform" {
  name                = var.vm_name
  resource_group_name = var.rg_name
  location            = var.location
  size                = var.vm_size
  #cred
  admin_username = var.admin_user
  admin_password = var.admin_pwd
  # nic
  network_interface_ids = [
    azurerm_network_interface.vm_nic.id,
  ]
  # time zone
  timezone = "Eastern Standard Time"

  # os disk
  os_disk {
    name                 = var.vm_disk
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  # image
  # az vm image list -f windowsserver -o table
  source_image_reference {
    publisher = "MicrosoftWindowsServer"
    offer     = "WindowsServer"
    sku       = "2019-Datacenter"
    version   = "latest"
  }
}

# vm-extension 
resource "azurerm_virtual_machine_extension" "vm_extension" {
  name                 = var.vm_name
  virtual_machine_id   = azurerm_windows_virtual_machine.vm_terraform.id
  publisher            = "Microsoft.Compute"
  type                 = "CustomScriptExtension"
  type_handler_version = "1.10"

  settings           = <<SETTINGS
    {
        "fileUris": ["https://raw.githubusercontent.com/pc-aide/Azure/main/az-204-dev/LAB/Lab02%20-%20IIS_installed/V0.1/vmExtension.ps1"]
    }
SETTINGS
  protected_settings = <<PROTECTED_SETTINGS
    {
      "commandToExecute": "powershell -ExecutionPolicy Unrestricted -File vmExtension.ps1"
    }
  PROTECTED_SETTINGS
}
