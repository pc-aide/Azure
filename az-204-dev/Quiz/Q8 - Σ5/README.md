# Q8 - Σ5

---

## Questions
|n|Question|Answer|
|-|--------|------|
|1|You have to develop code that will make use of a managed identity of an Azure virtual machine. The application code must be able to access a Blob in an Azure storage account. Which of the following must be done to ensure that the code will be able to access the blob via the use of the managed identity?<br/><br/>a. Assign delegated permissions to the app object<br/>b. Assign user permisssions to the app object<br/>c. Assign the managed identity role-based access to the storage account<br/>d.Assign the managed identity role-based access to the VM|<details><summary>Answer</summary>c. Assign the managed identity role-based access to the storage account<br/><br/>To ensure the code can access the storage account, the managed identity must be given access to the Storage account.</details>|
|2|You have to develop code that will make use of a managed identity of an Azure virtual machine. The application code must be able to access a Blob in an Azure storage account. You need to complete the below application code for this requirement.<br/>[<img src="https://i.imgur.com/5zmnuAA.png">](https://i.imgur.com/5zmnuAA.png)<br/>Which of the following would go into Slot 1 ?<br/><br/>a. clientCredential<br/>b. tokenCredential<br/>c. DefaultAzureCredential();<br/>d. Managed AzureCredential();|<details><summary>Answer</summary>b. TokenCredential<br/><br/>Here we can make use of the TokenCredential class.</details>|
|3|You have to develop code that will make use of a managed identity of an Azure virtual machine. The application code must be able to access a Blob in an Azure storage account. You need to complete the below application code for this requirement.<br/>[<img src="https://i.imgur.com/5zmnuAA.png">](https://i.imgur.com/5zmnuAA.png)<br/>Which of the following would go into Slot 2 ?<br/><br/>a. clientCredential<br/>b. tokenCredential<br/>c. DefaultAzureCredential();<br/>d. Managed AzureCredential();|<details><summary>Answer</summary>c. DefaultAzureCredential();</details>|
|4|Your Azure AD tenant contains an Application object with the following permissions<br/>[<img src="https://i.imgur.com/X7CVPsD.png">](https://i.imgur.com/X7CVPsD.png)<br/>You are planning on using the POSTMAN tool and the details of the application object to invoke the Microsoft Graph API.<br/>Would you be able to read the details of users from the POSTMAN tool using this application object ?<br/><br/>a. yes<br/>b. no|<details><summary>Answer</summary>b. no<br/><br>The application object has not been granted application permissions to read the details of the user.</details>|
|5|Your Azure AD tenant contains an Application object with the following permissions<br/>[<img src="https://i.imgur.com/X7CVPsD.png">](https://i.imgur.com/X7CVPsD.png)<br/>You are planning on using the POSTMAN tool and the details of the application object to invoke the Microsoft Graph API.<br/>Would you be able to read the details of user’s calendars from the POSTMAN tool using this application object?<br/><br/>a. yes<br/>b. no|<details><summary>Answer</summary>a. yes<br/><br/>Yes, since application permissions have been granted for this requirement</details>|

---

## Results
1. 09-06-2023 AM | 3/5 = 60%
