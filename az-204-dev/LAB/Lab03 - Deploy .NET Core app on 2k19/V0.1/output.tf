output "DNS_name" {
  value = azurerm_public_ip.pip.fqdn
}

output "vm_pip" {
  value = azurerm_public_ip.pip.ip_address
}
