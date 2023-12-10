# Microsoft Defender Antivirus for AVD

---

## URL
1. [Download and unpackage the latest updates](https://learn.microsoft.com/en-us/microsoft-365/security/defender-endpoint/deployment-vdi-microsoft-defender-antivirus?view=o365-worldwide#download-and-unpackage-the-latest-updates)

---

## PowerShell
````ps1
$vdmpathbase = "$env:systemdrive\wdav-update\{00000000-0000-0000-0000-"
$vdmpathtime = Get-Date -format "yMMddHHmmss"
$vdmpath = $vdmpathbase + $vdmpathtime + '}'
$vdmpackage = $vdmpath + '\mpam-fe.exe'

New-Item -ItemType Directory -Force -Path $vdmpath | Out-Null

Invoke-WebRequest -Uri 'https://go.microsoft.com/fwlink/?LinkID=121721&arch=x64' -OutFile $vdmpackage

Start-Process -FilePath $vdmpackage -WorkingDirectory $vdmpath -ArgumentList "/x"
````

---

## GPO
1. Path `Computer\Windows Components\Microsoft Defender Antivirus\Security Intelligence Updates\Define security intelligence location for VDI clients.`
2. Path_Reg `HKLM\Software\Policies\Microsoft\Windows Defender\Signature Updates`
3. Name_Reg `SharedSignatureRoot`
4. Type_Reg : REG_SZ

<img src="https://i.imgur.com/m18qo7A.png">

