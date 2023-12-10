# Microsoft Defender Antivirus for AVD

---

## URL
1. [Download & unpackage the latest updates]([https://learn.microsoft.com/en-us/training/modules/install-configure-apps-session-host/3-how-msix-app-attach-works](https://learn.microsoft.com/en-us/microsoft-365/security/defender-endpoint/deployment-vdi-microsoft-defender-antivirus?view=o365-worldwide#download-and-unpackage-the-latest-updates))

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
