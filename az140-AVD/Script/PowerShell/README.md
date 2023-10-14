# PowerShell

---

## List
|n|name|e.g.|O/P|
|-|----|----|---|
|1|Connect-azAccount||
|2|# custom RDP property<br/>`Set-RdsHostPool -TenantName <tenantname> -Name <hostpoolname> -CustomRdpProperty "<property>"`<br/><br/># multiple custom ... properties<br/>`$properties="<property1>;<property2>;<property3>"`<br/>`Set-RdsHostPool -TenantName <tenantname> -Name <hostpoolname> -CustomRdpProperty $properties`<br/><br/># Reset all custom RDP properties<br/>`Set-RdsHostPool -TenantName <tenantname> -Name <hostpoolname> -CustomRdpProperty ""`|<img src="https://i.imgur.com/qSvlRpQ.png">|
