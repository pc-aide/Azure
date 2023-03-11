output "DNS_name" {
  value = azurerm_public_ip.pip.fqdn
}

output "vm_pip" {
  value = azurerm_windows_virtual_machine.vm_srv.public_ip_address
}

# checkUp how func work
output "fun_chomp" {
  value = data.http.icanhazip.request_body
}
