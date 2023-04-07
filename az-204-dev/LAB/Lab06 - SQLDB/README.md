# Lab06 - SQLDB

---

## Acronym
1. DTU - Dabase Transaction Units
2. SSMS - SQL Server Management Studio

---

## Create SQL Database
### Basic
1. Database name : appDB
2. Server\Create new
  * server name : appserver<3000>.database.windows.net 
    * Server should no contain reserved workd 
    * The specified server name is not already in use
    * lower case only
3. Authentication method : Ue SQL auth
  * Server admin login : sqladmin
  * pwd : <string>
4. Compute + storage : 
  * Service tier : Basic (For lesss demanding workloads)
  
[<img src="https://i.imgur.com/HX5BUpe.png">](https://i.imgur.com/HX5BUpe.png)

---
 
### Networking
 1. Connectivity method : Public endpoint
 2. Firwall rules
  * Allow Azure service & resource to access this server : yes
 * Add current client IP address : yes
 
[<img src="https://i.imgur.com/yXsk4R0.png">](https://i.imgur.com/yXsk4R0.png)

---
 
### Connect to SRV
0. Default port : 1433
1. [SSMS-19](https://aka.ms/ssmsfullsetup)
2. Connect
 * Server name : <sql_srv_fqdn>
 * Auth : SQL SRV Atu
  * Login : sqladmin
  * pwd : <pwd>
