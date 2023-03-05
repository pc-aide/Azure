output "DNS_name" {
  value = azurerm_public_ip.pip.fqdn
}

output "vm_pip" {
  value = azurerm_windows_virtual_machine.vm_srv.public_ip_address
}
