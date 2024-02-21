# Terminology

---

## List
|n|Name|Desc.|e.g.|O/P|
|-|----|-----|----|---|
|1|Azure Import Export|
|2|Managed identity|Azure Managed Identity is a feature that provides Azure services with an automatically managed identity in Azure Active Directory (Azure AD). This eliminates the need for developers to manage credentials. Managed identities can be used to securely access other Azure services that support Azure AD authentication, without needing to store any credentials in code or configuration files. There are two types of managed identities: System-Assigned and User-Assigned.<br/><br/><details><summary>System assigned</summary>This is enabled directly on an Azure service instance. When the service instance is deleted, Azure automatically cleans up the credentials and the identity in Azure AD.</details><details><summary>User-Assigned</summary>This is a standalone Azure resource that can be assigned to one or more Azure service instances. It's created independently of the services that use it, and its lifecycle is managed separately from the service instances it's assigned to.</details>||<img src="https://i.imgur.com/3q9BHpj.png">|
