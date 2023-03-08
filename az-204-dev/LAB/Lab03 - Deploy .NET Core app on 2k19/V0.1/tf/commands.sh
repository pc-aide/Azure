# account cleanUp
az account clear

# creds
read -p "Your email: " email && az login -u $email

# code format
terraform fmt -recursive

# init
terraform init

# validate
terraform validate

# graph with graphviz (dot)
terraform graph | dot -Tsvg > graph.svg

# deploy
terraform apply -auto-approve

# to update resource (eg: vmEntension, nsg)
# terraform state list (to list resources)
terraform apply -auto-approve -replace="azurerm_network_security_group.nsg_nic"

# destroy
terraform destroy -auto-approve
