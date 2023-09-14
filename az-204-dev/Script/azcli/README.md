`resourceGroup=$(az group list --query "[].{id:name}" -o tsv)`
<br/>
`appName=az204app$RANDOM`
