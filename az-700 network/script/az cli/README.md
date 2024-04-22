# az cli

---

## List
|n|name|desc.|e.g.|O/P|
|-|----|-----|----|---|
|1|list locations||`az account list-locations -o table \| more`|<img src="https://i.imgur.com/rJJKMTL.png">|
|2|list usage||`az vm list-usage --location eastus -o table \| more`|<img src="https://i.imgur.com/hRjanE0.png">|
|3|list skus||az vm list-skus --location eastus --size Standard_B --all --query "[?restrictions[0].reasonCode != \\`NotAvailableForSubscription\`]" --output table |<img src="https://i.imgur.com/mqtKLqN.png">|
