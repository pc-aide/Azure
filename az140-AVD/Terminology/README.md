# Terminology

---

## URL
|n|Name|
|-|----|
|1|[how-msix-app-attach-works](https://learn.microsoft.com/en-us/training/modules/install-configure-apps-session-host/3-how-msix-app-attach-works)|
|2|[Learning Path](https://learn.microsoft.com/en-us/training/browse/?terms=az-140)

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
|1|AVD Client<details><summary>Toubleshoot</summary>Reset the user data:<br/>`msrdcw.exe /reset [/f]`<br/><br/>Web client won't open<br/>checkUp DNS:<br/>`nslookup rdweb.wvd.microsoft.com`</details>|
|2|Application group (remoteApp)|
|3|Azure File Sync||<img src="https://i.imgur.com/kP8JKI1.png">|
|4|Azure Image Builder (similar to TaskSequence)||
|5|Azure NetApp Files|aka DFS|Overview:<br/><img src="https://i.imgur.com/KmQm0fU.png"><br/><br/>ANF-FSLogix:<br/><img src="https://i.imgur.com/Zs1NoT0.png"><br/><br/>Previous ver:<br/><img src="https://i.imgur.com/XN9Rh2Y.png">|
|5|FSLogix profile containers<details><summary>Profile Status<br/></summary><img src="https://i.imgur.com/rudk28D.png"></details><details><summary>Office Container</summary>a subset of Profile Container</details><details><summary>ODFC (reg)</summary><img src="https://i.imgur.com/GhVknw2.png"></details><details><summary>OneDrive\Exclude profile solution(reg)</summary>`HKLM\Software\FSLogix\Logging\LoggingEnabled = 2`<br/><img src="https://i.imgur.com/VPxuxI1.png"></details>||
|6|Load balancing<details><summary>Breadth First</summary>To evenly distribute new user sessions across the session hosts in a host pool</details><details><summary>Depth First</summary>Starting new user sessions on one session host until the maximum session limit is reached.Once the session limit is reached, any new user connections are directed to the next session host in the host pool until it reaches its session limit, and so on</details><details><summary>Persistent</summary>Configured to direct requests from the same client to the same desktop every time that client connects</details>|
|7|msix app attach<br/><br/><details><summary>Optimize msix app attach per.</summary>The storage solution you use for MSIX app attach should be in the same datacenter location as the session hosts<br/>To avoid performance bottlenecks, exclude the following VHD, VHDX, and CIM files from antivirus scans:<br/><br/>`<MSIXAppAttachFileShare\>\*.VHD`<br/>`<MSIXAppAttachFileShare\>\*.VHDX`<br/>`\\storageaccount.file.core.windows.net\share*.VHD`<br/>`\\storageaccount.file.core.windows.net\share*.VHDX`<br/>`<MSIXAppAttachFileShare>.CIM`<br/>`\\storageaccount.file.core.windows.net\share**.CIM`<br/><br/>All VM system accounts and user accounts must have read-only permissions to access the file share<br/>Any disaster recovery plans for Azure Virtual Desktop must include replicating the MSIX app attach file share in your secondary failover location</details>|app streaming (aka app-v5.x)|<img src="https://i.imgur.com/TCmAj4T.png"><br/><ins>how-msix-app-attach-work (mount userProfile & app attach vhd):</ins><br/><img src="https://i.imgur.com/HFqZ0xT.png">||
|8|MSIX images|
|9|multi-session<br/><details><summary>Teams Desktop</summary>Install the app on your w10 multi-session<br/>`msiexec /i <path_to_msi> /l*v <install_logfile_name> ALLUSER=1 /noRestart /q`<br/><br/>`New-ItemProperty "HKLM:\SOFTWARE\Microsoft\Teams" -Name "IsAVDEnvironment" -PropertyType DWord -Value 1`</details><details><summary>Remote Desktop WebRTC Redirector Service</summary>[msi](https://learn.microsoft.com/en-us/training/modules/install-configure-apps-session-host/8-microsoft-teams-azure-virtual-desktop#:~:text=Remote%20Desktop%20WebRTC%20Redirector%20Service)<br/><img src="https://i.imgur.com/o3znvBk.png"><br/>checkUp if Teams for AVD is Optimized:<br/><img src="https://i.imgur.com/bNpsuIL.png"></details>||
|10|Publish built-in apps<br/><details><summary>default:</summary>`New-AzWvdApplication -Name <applicationname> -ResourceGroupName <resourcegroupname> -ApplicationGroupName <appgroupname> -FilePath "shell:appsFolder\<PackageFamilyName>!App" -CommandLineSetting <Allow\|Require\|DoNotAllow> -IconIndex 0 -IconPath <iconpath> -ShowInPortal:$true`</details><details><summary>MS Edge is a little different...:</summary>`New-AzWvdApplication -Name -ResourceGroupName -ApplicationGroupName -FilePath "shell:Appsfolder\Microsoft.MicrosoftEdge_8wekyb3d8bbwe!MicrosoftEdge" -CommandLineSetting <Allow\|Require\|DoNotAllow> -iconPath "C:\Windows\SystemApps\Microsoft.MicrosoftEdge_8wekyb3d8bbwe\microsoftedge.exe" -iconIndex 0 -ShowInPortal:$true`</details>|
|11|Troubleshoot:<details><summary>app-issues-user-input-delay(Perfmon)</summary>`reg add "HKLM\System\CurrentControlSet\Control\Terminal Server" /v "EnableLagCounter" /t REG_DWORD /d 0x1 /f`<br/><br/>performanceMonitor_addCounters:<br/><img src="https://i.imgur.com/V7QieXk.png"><br/>max session input delay (ms):<br/><img src="https://i.imgur.com/Pc44xUm.png"><br/>max process input delay:<br/><img src="https://i.imgur.com/2L55cgR.png"><br/>e.g.:if the Calculator app is running in a Session ID 1, you'll see `1:4232 <Calculator.exe`<br/>max prcess input delay (ms) for Calculator.exe<br/><img src="https://i.imgur.com/26MWww0.png"><br/>the Report if perfromance for an app is degraded<br/><img src="https://i.imgur.com/p0hLYfO.png"></details>||
|12|Universal Print<details><summary>Universal Print connector (register for printers)</summary><img src="https://i.imgur.com/REMwX01.png"><br/>Register a printer:<br/><img src="https://i.imgur.com/bTo7Qxq.png"></details>|<img src="https://i.imgur.com/dVU3z2h.png">|
|13|User Profile|Contains data eleements about an individual, including cfg information like desktop settings, persisten network connections, & app settings|
|14|VHD Locations<details><summary>User Profile vhdx(reg)</summary><img src="https://i.imgur.com/BhSeUA5.png"></details><details><summary>FSLogix\SID\VHDX file</summary><img src="https://i.imgur.com/LOkktcu.png"></details><details><summary>Cloud Cache for SMB(reg)</summary>`$registryPath = "HKLM:\SOFTWARE\FSLogix\Profiles"`<br/><br/>`$ccdLocationsValue = "type=smb,connectionString=<\Location1\Folder1>;type=smb,connectionString=<\Location2\folder2>"`<br/><br/>`$enabledValue = 1`<br/><br/>`if (!(Test-Path -Path "$registryPath\CCDLocations")) {New-ItemProperty -Path $registryPath -Name "CCDLocations" -Value $ccdLocationsValue -PropertyType MultiString}`<br/><br/>`if (!(Test-Path -Path "$registryPath\Enabled")) {New-ItemProperty -Path $registryPath -Name "Enabled" -Value $enabledValue -PropertyType DWORD}`<br/><br/>e.g.\Cloud Cache for SMB:<br/><img src="https://i.imgur.com/t0pmjM1.png"></details><details><summary>Cloud Cache for Office Container(reg)</summary>`HKLM\SOFTWARE\Policies\FSLogix\ODFC` & same thing logic registries that the cloud cache for SMB</details><details><summary>cfg Profile containers</summary>`# 0: no deletion`<br/>`1: delete local profile if exists and matches the profile being loaded from VHD`<br/><br/>`new-itemProperty "hklm:\software\fsLogix\profiles" -name DeleteLocalProfileWhenVHDShouldApply -value 1 -propertyType dword`<br/><br/>`# 1: the SID folder is created as "%username%%sid%" instead of the default "%sid%%username%"`<br/><br/>`New-ItemProperty  "HKLM:\SOFTWARE\FSLogix\Profiles" -Name "FlipFlopProfileDirectoryName" -Value 1 -PropertyType DWord`<br/><br/>`# 1:  Profile Container loads FRXShell if there's a failure attaching to, or using an existing profile VHD(X)`<br/>`# The user receives the FRXShell prompt - default prompt to call support, and the users only option will be to sign out`<br/><br/>`New-ItemProperty  "HKLM:\SOFTWARE\FSLogix\Profiles" -Name "PreventLoginWithFailure" -Value 1 -PropertyType DWord`<br/><br/>`# 1: Profile Container loads FRXShell if it's determined a temp profile has been created. The user receives the FRXShell prompt - default prompt to call support, and the users only option will be to sign out`<br/><br/>`New-ItemProperty  "HKLM:\SOFTWARE\FSLogix\Profiles" -Name "PreventLoginWithTempProfile" -Value 1 -PropertyType DWord`</details>|
