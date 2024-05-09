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
|6|netdom|tool allows you to manage AD DS trust; it can also join a computer to a domain, manage computer accounts, query for domain information such as which DCs hold the FSMO roles, and more|error - the trust relationship between this workstation & the primary domain failed<br/><img src="https://i.imgur.com/qTBSMez.png"><br/>Local Administrator<br/><img src="https://i.imgur.com/AA60QXe.png"><br/>utility netdom<br/>`C:\Windows\System32>netdom.exe resetpwd /s:w2k8r2-dc01 /ud:NOLABNOPARTY\Administrator /pd:*`<br/><img src="https://i.imgur.com/isX9qc9.png">|
|7|repadmin|tool helps you view the service's health & diagnose replication problems between DCs|repadmin /replsummary<br/><img src="https://i.imgur.com/vlLxpOK.png">|
