# Terminology

---

## List
|n|name|desc.|O/P|
|-|----|-----|---|
|1|App Registration|* Any app that outsources authentication to AAD must be registered in a directory (tenant)<br/><br/>* Registration involves telling AAD about the app, including the URL where it's located, the URL to send replies to after auth, the URI to identify your app, and more<br/><br/><ins>e.g - SAML web UI login Fortigate:</ins>|
|2|CA|<details><summary>Conditional Access</summary>True</details>|
|3|cer file|
|4|MFA|<ins>Something you know:</ins><br/>Password or answer to security question<br/><br/><ins>Something you possess:</ins><br/>Mobile app or token device<br/><br/><ins>Something your are:</ins><br/>Biometric property such as finger print 
|5|Key Vault|<details><summary>Secrets</summary><img src="https://i.imgur.com/dMwBKrZ.png"></details><details><summary>Certificates</summary><img src="https://i.imgur.com/0aru5St.png"></details>|
|6|Security defaults|<details><summary>Old tenant, disabled vs new tenant</summary><br/>Requiring all users to register for multifactor authentication<br/>Requiring administrators to do multifactor authentication<br/>Requiring users to do multifactor authentication when necessary<br/>Blocking legacy authentication protocols<br/>Protecting privileged activities like access to the Azure portal<br/><br/><ins>Old tenant:</ins><br/><img src="https://i.imgur.com/kiReFU4.png"><br/><ins>NewTenant:</ins><br/><img src="https://i.imgur.com/n0wU48M.png"></details>
