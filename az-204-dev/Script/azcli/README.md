`resourceGroup=$(az group list --query "[].{id:name}" -o tsv)`

`appName=az204app$RANDOM`
