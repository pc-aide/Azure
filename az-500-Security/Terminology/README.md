# Terminology

---

## List
|n|name|desc.|O/P|
|-|----|-----|---|
|1|Azure Blueprints|* Azure Blueprints enables cloud architects & central information technology groups to define a repeatable set of Azue resources that implements & adheres to an organization's standards, patterns, & requirements<br/><br/>* The Azure Blueprints service is designed to help with environment setup, which often consists of a set of resource groups, policies, role assignments, & Resource Manager template deployments. A blueprint is a package to bring each of these artifact types together<details><summary>eg - IAM Role - admLocal login for new VM</summary><ins>Create blueprint</ins><br/><img src="https://i.imgur.com/DsXWCp9.png"><br/><ins>Artifacts:<img src="https://i.imgur.com/pc24zWs.png"><br/>Role : virtual machine administrator login:<br/><img src="https://i.imgur.com/wzUOgSP.png"><br/>Publish blueprint:<br/><img src="https://i.imgur.com/DiqxmEc.png"><br/><img src="https://i.imgur.com/cAA0NrC.png"><br/>Assign blueprint:<br/><img src="https://i.imgur.com/mxCydv3.png"><br/><img src="https://i.imgur.com/XpuDCEW.png"><br/>System assigned:<br/><img src="https://i.imgur.com/knAxkRg.png"><br/>Test - New VM:<br/><img src="https://i.imgur.com/dG1RcMZ.png"><br/>New VM - IAM - automatic role assignments - vm admin login:<br/><img src="https://i.imgur.com/F3HNSo7.png"></ins></details>|
|2|Azure Locks|
|3|Azure Policy|* Azure Policy helps to enfore organizational standards & to assess compliance. Through its compliance dashboard, it provides a view to evaluate the overrall state of the environment.<br/><br/>* Azure Policy also helps to bring your resources to compliance though bulk remediation for existing resources & automatic remediation for new resources 
|4|App Registration|* Any app that outsources authentication to AAD must be registered in a directory (tenant)<br/><br/>* Registration involves telling AAD about the app, including the URL where it's located, the URL to send replies to after auth, the URI to identify your app, and more<br/><br/><ins>e.g - SAML web UI login Fortigate:</ins>|
|5|CA|<details><summary>Conditional Access</summary>True</details>|
|6|cer file|
|7|MFA|<ins>Something you know:</ins><br/>Password or answer to security question<br/><br/><ins>Something you possess:</ins><br/>Mobile app or token device<br/><br/><ins>Something your are:</ins><br/>Biometric property such as finger print 
|8|Key Vault|<details><summary>Secrets</summary><img src="https://i.imgur.com/dMwBKrZ.png"></details><details><summary>Certificates</summary><img src="https://i.imgur.com/0aru5St.png"></details>|
|9|Security defaults|<details><summary>Old tenant, disabled vs new tenant</summary><br/>Requiring all users to register for multifactor authentication<br/>Requiring administrators to do multifactor authentication<br/>Requiring users to do multifactor authentication when necessary<br/>Blocking legacy authentication protocols<br/>Protecting privileged activities like access to the Azure portal<br/><br/><ins>Old tenant:</ins><br/><img src="https://i.imgur.com/kiReFU4.png"><br/><ins>NewTenant:</ins><br/><img src="https://i.imgur.com/n0wU48M.png"></details>
