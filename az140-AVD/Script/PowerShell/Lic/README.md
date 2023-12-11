# Lic

---

## Acronym
1. lic - license

---

## Add lic to VM
````ps1
$vm = Get-AzVM -ResourceGroup <resourceGroupName> -Name <vmName>
$vm.LicenseType = "Windows_Client"
Update-AzVM -ResourceGroupName <resourceGroupName> -VM $vm
````
<img src="https://i.imgur.com/FBSQyZv.png">
