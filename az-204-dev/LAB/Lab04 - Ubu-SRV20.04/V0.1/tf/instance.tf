resource "azurerm_linux_virtual_machine" "vm_ubu" {
  name                = var.vm_name
  location            = var.location
  resource_group_name = azurerm_resource_group.rg_lab.name
  size                = var.vm_size

  # boostrap
  custom_data = filebase64("./user_data.sh")

  # creds
  admin_username                  = var.adm_usr
  admin_password                  = var.adm_pwd
  disable_password_authentication = false

  # nic
  network_interface_ids = [
    azurerm_network_interface.nic.id
  ]

  # OS
  os_disk {
    caching              = "ReadWrite"
    storage_account_type = var.os_disk
  }

  # image
  source_image_reference {
    publisher = var.ima_pub
    offer     = var.ima_off
    sku       = var.ima_sku
    version   = var.ima_ver
  }
}
