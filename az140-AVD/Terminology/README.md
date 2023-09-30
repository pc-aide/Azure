# Terminology

---

## URL
|n|Name|
|-|----|
|1|[how-msix-app-attach-works](https://learn.microsoft.com/en-us/training/modules/install-configure-apps-session-host/3-how-msix-app-attach-works)|

---

## Acronym
|n|Name|Desc.|
|-|----|-----|
|1|aka|Also Known As|
|2|IOPs|Input/output operations per second|
|3|vhd|virtual Hard Drive|
|4|VHDx|Hyper-V Virtual Hard Disk|

---

## List
|n|name|Desc.|img|e.g.|
|-|----|-----|---|----|
|1|Azure NetApp Files||Overview:<br/><img src="https://i.imgur.com/KmQm0fU.png"><br/><br/>ANF-FSLogix:<br/><img src="https://i.imgur.com/Zs1NoT0.png">|
|2|FSLogix Profiles|
|3|msix app attach<br/><br/><details><summary>Optimize msiz app attach per.</summary>The storage solution you use for MSIX app attach should be in the same datacenter location as the session hosts<br/>To avoid performance bottlenecks, exclude the following VHD, VHDX, and CIM files from antivirus scans:<br/><br/>`<MSIXAppAttachFileShare\>\*.VHD`<br/>`<MSIXAppAttachFileShare\>\*.VHDX`<br/>`\\storageaccount.file.core.windows.net\share*.VHD`<br/>`\\storageaccount.file.core.windows.net\share*.VHDX`<br/>`<MSIXAppAttachFileShare>.CIM`<br/>`\\storageaccount.file.core.windows.net\share**.CIM`<br/><br/>All VM system accounts and user accounts must have read-only permissions to access the file share<br/>Any disaster recovery plans for Azure Virtual Desktop must include replicating the MSIX app attach file share in your secondary failover location</details>|app streaming (aka app-v5.x)|<img src="https://i.imgur.com/TCmAj4T.png"><br/><ins>how-msix-app-attach-work (mount userProfile & app attach vhd):</ins><br/><img src="https://i.imgur.com/HFqZ0xT.png">||
|4|Universal Print|

