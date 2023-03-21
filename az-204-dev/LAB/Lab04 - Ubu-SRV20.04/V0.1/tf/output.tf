output "DNS_name" {
  value = azurerm_public_ip.pip.fqdn
}

output "vm_pip" {
  value = azurerm_linux_virtual_machine.vm_ubu.public_ip_address
}

# ISP
# dois-je utiliser func_chomp ?
# si j'ai saut de lignes (newLine), alors oui
output "ISP" {
  value = data.http.ifconfigme.response_body
}
