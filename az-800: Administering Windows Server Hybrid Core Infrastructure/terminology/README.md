# terminology

---

## List
|n|name|desc.|O/P|
|-|----|-----|---|
|1|administrative tmp|.admx file<br/>.adml file<br/>`%systemRoot%\policyDefinitions`<br/>`%systemRoot%\policyDefinitions\<lang>`|PolicyDefinitionsFolder<br/><img src="https://i.imgur.com/5OW7zFT.png"><br/><img src="https://i.imgur.com/qDAFIpu.png">|
|2|Deleted objects container|If groups in AD were mistakenly deleted due to misinformation, this feature allows them to be restored|<img src="https://i.imgur.com/TUO8RzF.png">|
|3|dcdiag|tool will analyze the state of the health of AD DS DCs|<img src="https://i.imgur.com/tOIu3R4.png">|
|4|Entra Connect - sync||<img src="https://i.imgur.com/4tU6MoD.png">|
|5|gpedit.msc (gpo local)||<img src="https://i.imgur.com/R1sSOuw.png">|
|6|GPO|GP tmpl<br/>`%systemRoot%\sysvol\<domain>\policies\<GPOGUID>`<br/><br/>Central Store:<br/>`\\<FQDN>\sysvol\FQDN\Policies\`|
|7|netdom|tool allows you to manage AD DS trust; it can also join a computer to a domain, manage computer accounts, query for domain information such as which DCs hold the FSMO roles, and more|error - the trust relationship between this workstation & the primary domain failed<br/><img src="https://i.imgur.com/qTBSMez.png"><br/>Local Administrator<br/><img src="https://i.imgur.com/AA60QXe.png"><br/>utility netdom<br/>`C:\Windows\System32>netdom.exe resetpwd /s:w2k8r2-dc01 /ud:NOLABNOPARTY\Administrator /pd:*`<br/><img src="https://i.imgur.com/isX9qc9.png">|
|8|service principle name (SPN)|Sometimes, due to incorrect configuration of the service principal name (SPN), it is unable to establish PS-Remoting on a specific host<br/><br/>To correct this, adjustments need to be made to the SPN of the host in question to enable our remote PowerShell<br/><br/>checkUp<br/>`setspn -l HostName`<br/>bad SPN, so delete it:<br/>`setspn -d HTTP/HostName`<br/>add a SPN:<br/>`setspn -a HTTP/HostName ServiceAccount`|SPN register host<br/><img src="https://i.imgur.com/3E6Jtv8.png">|
|9|repadmin|tool helps you view the service's health & diagnose replication problems between DCs|repadmin /replsummary<br/><img src="https://i.imgur.com/vlLxpOK.png">|
|10|RSoPs||<img src="https://i.imgur.com/EzOxYdg.png">|
