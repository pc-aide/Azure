# az cli

---

## List
|n|name|e.g.|O/P|
|-|----|----|---|
|1|list locations|`az account list-locations -o table \| more`|<img src="https://i.imgur.com/rJJKMTL.png">|
|2|list usage|`az vm list-usage --location eastus -o table \| more`|<img src="https://i.imgur.com/hRjanE0.png">|
|3|list skus|az vm list-skus --location eastus --size Standard_B --all --query "[?restrictions[0].reasonCode != \\`NotAvailableForSubscription\`]" --output table |<img src="https://i.imgur.com/mqtKLqN.png">|
|4|image|`group=CharisTechRG`<br/>`location=eastus`<br/>`VNet=CoreServicesVNet`<br/>`subnet=PublicWebServiceSubnet`<br/>`size=Standard_B2s`<br/><br/>`az vm create -g $group -n WebVM1 --image Ubuntu2204 --admin-username azureuser --generate-ssh-keys --vnet-name $VNet --subnet $subnet --size $size --public-ip-address "" --private-ip-address "10.0.0.34"`|<img src="https://i.imgur.com/RFOfkmy.png">|
