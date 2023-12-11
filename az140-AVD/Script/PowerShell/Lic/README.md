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

* checkUp VM is any there a lic :

 <img src="https://i.imgur.com/FD4Hdnh.png">
