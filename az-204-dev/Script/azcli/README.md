`resourceGroup=$(az group list --query "[].{id:name}" -o tsv)`
<br/>
`appName=az204app$RANDOM`
<br/>
`az webapp up -g $resourceGroup -n $appName --html`
