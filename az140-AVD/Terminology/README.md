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
|2|HPC|High-Performance Compute|HPC infrastructure & apps|
|3|IOPs|Input/output operations per second|
|4|ODFC|Office Data Folder Container (FSLogix)|
|5|RDSH|Remote Desktop Session Host|
|6|VDI|Virtual Desktop Infrastructures|
|7|vhd|virtual Hard Drive|
|8|VHDx|Hyper-V Virtual Hard Disk|

---

## List
|n|name|Desc.|img|e.g.|
|-|----|-----|---|----|
|1|Application group (remoteApp)|
|2|Azure File Sync||<img src="https://i.imgur.com/kP8JKI1.png">|
|3|Azure NetApp Files|aka DFS|Overview:<br/><img src="https://i.imgur.com/KmQm0fU.png"><br/><br/>ANF-FSLogix:<br/><img src="https://i.imgur.com/Zs1NoT0.png"><br/><br/>Previous ver:<br/><img src="https://i.imgur.com/XN9Rh2Y.png">|
|4|FSLogix profile containers<details><summary>Profile Status<br/></summary><img src="https://i.imgur.com/rudk28D.png"></details><details><summary>Office Container</summary>a subset of Profile Container</details><details><summary>ODFC (reg)</summary><img src="https://i.imgur.com/GhVknw2.png"></details><details><summary>OneDrive\Exclude profile solution(reg)</summary>`HKLM\Software\FSLogix\Logging\LoggingEnabled = 2`<br/><img src="https://i.imgur.com/VPxuxI1.png"></details>||
|5|msix app attach<br/><br/><details><summary>Optimize msix app attach per.</summary>The storage solution you use for MSIX app attach should be in the same datacenter location as the session hosts<br/>To avoid performance bottlenecks, exclude the following VHD, VHDX, and CIM files from antivirus scans:<br/><br/>`<MSIXAppAttachFileShare\>\*.VHD`<br/>`<MSIXAppAttachFileShare\>\*.VHDX`<br/>`\\storageaccount.file.core.windows.net\share*.VHD`<br/>`\\storageaccount.file.core.windows.net\share*.VHDX`<br/>`<MSIXAppAttachFileShare>.CIM`<br/>`\\storageaccount.file.core.windows.net\share**.CIM`<br/><br/>All VM system accounts and user accounts must have read-only permissions to access the file share<br/>Any disaster recovery plans for Azure Virtual Desktop must include replicating the MSIX app attach file share in your secondary failover location</details>|app streaming (aka app-v5.x)|<img src="https://i.imgur.com/TCmAj4T.png"><br/><ins>how-msix-app-attach-work (mount userProfile & app attach vhd):</ins><br/><img src="https://i.imgur.com/HFqZ0xT.png">||
|6|MSIX images|
|7|multi-session<br/><details><summary>Teams Desktop</summary>Install the app on your w10 multi-session<br/>`msiexec /i <path_to_msi> /l*v <install_logfile_name> ALLUSER=1 /noRestart /q`<br/><br/>`New-ItemProperty "HKLM:\SOFTWARE\Microsoft\Teams" -Name "IsAVDEnvironment" -PropertyType DWord -Value 1`</details><details><summary>Remote Desktop WebRTC Redirector Service</summary>[msi](https://learn.microsoft.com/en-us/training/modules/install-configure-apps-session-host/8-microsoft-teams-azure-virtual-desktop#:~:text=Remote%20Desktop%20WebRTC%20Redirector%20Service)<br/><img src="https://i.imgur.com/o3znvBk.png"><br/>checkUp if Teams for AVD is Optimized:<br/><img src="https://i.imgur.com/bNpsuIL.png"></details>||
|8|Publish built-in apps<br/><details><summary>default:</summary>`New-AzWvdApplication -Name <applicationname> -ResourceGroupName <resourcegroupname> -ApplicationGroupName <appgroupname> -FilePath "shell:appsFolder\<PackageFamilyName>!App" -CommandLineSetting <Allow\|Require\|DoNotAllow> -IconIndex 0 -IconPath <iconpath> -ShowInPortal:$true`</details><details><summary>MS Edge is a little different...:</summary>`New-AzWvdApplication -Name -ResourceGroupName -ApplicationGroupName -FilePath "shell:Appsfolder\Microsoft.MicrosoftEdge_8wekyb3d8bbwe!MicrosoftEdge" -CommandLineSetting <Allow\|Require\|DoNotAllow> -iconPath "C:\Windows\SystemApps\Microsoft.MicrosoftEdge_8wekyb3d8bbwe\microsoftedge.exe" -iconIndex 0 -ShowInPortal:$true`</details>|
|9|Troubleshoot:<details><summary>app-issues-user-input-delay(Perfmon)</summary>`reg add "HKLM\System\CurrentControlSet\Control\Terminal Server" /v "EnableLagCounter" /t REG_DWORD /d 0x1 /f`<br/><br/>performanceMonitor_addCounters:<br/><img src="https://i.imgur.com/V7QieXk.png"><br/>max session input delay (ms):<br/><img src="https://i.imgur.com/Pc44xUm.png"><br/>max process input delay:<br/><img src="https://i.imgur.com/2L55cgR.png"><br/>e.g.:if the Calculator app is running in a Session ID 1, you'll see `1:4232 <Calculator.exe`<br/>max prcess input delay (ms) for Calculator.exe<br/><img src="https://i.imgur.com/26MWww0.png"><br/>the Report if perfromance for an app is degraded<br/><img src="https://i.imgur.com/p0hLYfO.png"></details>||
|10|Universal Print|
|11|User Profile|Contains data eleements about an individual, including cfg information like desktop settings, persisten network connections, & app settings|
|12|VHD Locations<details><summary>User Profile vhdx(reg)</summary><img src="https://i.imgur.com/BhSeUA5.png"></details><details><summary>FSLogix\SID\VHDX file</summary><img src="https://i.imgur.com/LOkktcu.png"></details>|
