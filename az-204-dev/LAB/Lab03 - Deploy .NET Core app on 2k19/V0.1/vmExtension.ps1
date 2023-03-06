<#
  Time: ~20m
#>

#####################################################
#   VARIABLES   
#####################################################
$url_vsCommunity = "https://raw.githubusercontent.com/pc-aide/Azure/main/az-204-dev/LAB/Lab03%20-%20Deploy%20.NET%20Core%20app%20on%202k19/V0.1/vs_Community.exe"
$url_customInstall = "https://raw.githubusercontent.com/pc-aide/Azure/main/az-204-dev/LAB/Lab03%20-%20Deploy%20.NET%20Core%20app%20on%202k19/V0.1/customInstall.json"
# https://send-anywhere.com/#transfer
$url_project = "https://raw.githubusercontent.com/pc-aide/Azure/main/az-204-dev/LAB/Lab03%20-%20Deploy%20.NET%20Core%20app%20on%202k19/V0.1/WebApplication1.zip"



#####################################################
# FIlES in D:\ 
#####################################################

# Visual Studio 2022 Community
try{
  Start-BitsTransfer $url_vsCommunity `
  -destination "d:\vs_community.exe"
}catch{
  $_ | out-file "d:\error_dl_vsCommunity.txt"
}

#  CustomInstall.json file
try{
  Start-BitsTransfer $url_customInstall `
  -destination "d:\customInstall.json"
}catch{
	$_ | out-file "d:\error_dl_customInstall.txt"
}

# Project file
try{
	Start-BitsTransfer $url_project `
  -destination "d:\WebApplication1.sln"
}catch{
	$_ | out-file "d:\error_dl_webApp_extension_sln.txt"
}

#####################################################
# INSTALL APPS 
#####################################################

# Install Visual Studio 2022 Community
# Time ~13 (total space ~13.39 GB)
# pendingReboot : yes
try{
	start "d:\vs_community.exe" -args "--nocache --wait --in d:\customInstall.json" -Wait
}catch{
	$_ | out-file "d:\error_ins_visualStudioCommunity.txt"
}

#####################################################
#  ENV PATH
#####################################################



#####################################################
#  CUSTOM OS   
#####################################################

# msEdge as default browser
$RegistryPath = 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\System'
$Name = "DefaultAssociationsConfiguration"
$value = 'https://raw.githubusercontent.com/pc-aide/Azure/main/az-204-dev/LAB/Lab03%20-%20Deploy%20.NET%20Core%20app%20on%202k19/V0.1/defaultapplication.XML'
$result = "IE.HTTP"

try{
  New-ItemProperty -Path $registryPath -Name $name -Value $value -PropertyType String -Force 
}
catch{
  $_ | out-file "d:\error_defaultApp_xml.txt"
}

# Disable at log on of any user 
Disable-ScheduledTask -TaskPath "\Microsoft\Windows\Server Manager\" -TaskName servermanager

# Extend volume (os disk) + ~126GB
try{
	$drive_letter = "C"
	$size = (Get-PartitionSupportedSize -DriveLetter $drive_letter)
	Resize-Partition -DriveLetter $drive_letter -Size $size.SizeMax
	}
catch{
	$_ | out-file "d:\error_extend_volume_C.txt"
	}

# Install IIS
Add-WindowsFeature -name Web-Server

# Turn off the Network Location wizard
ni HKLM:\System\CurrentControlSet\Control\Network\ -Name NewNetworkWindowOff

# Disable Privacy Settings Experience Using 
ni HKLM:\SOFTWARE\Policies\Microsoft\Windows\ -Name OOBE
New-ItemProperty HKLM:\SOFTWARE\Policies\Microsoft\Windows\OOBE `
  -Name DisablePrivacyExperience -Type DWord -Value 1
  
# Disable First run welcome page Edge
ni HKLM:\SOFTWARE\Policies\Microsoft\ -Name Edge
New-ItemProperty HKLM:\SOFTWARE\Policies\Microsoft\Edge\ `
  -Name HideFirstRunExperience -Type DWord -Value 1

# Show File Extension	
try{
	reg load HKLM\DefaultUser C:\Users\Default\NTUSER.DAT
	$path = "HKLM:\Defaultuser\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced"
	New-ItemProperty -Path $path -Name HideFileExt -Value "0" -PropertyType DWord
	reg unload HKLM\DefaultUser
}
catch{
	$_ | out-file "d:\ErrorshowFileExtension.txt"
}
 
# Remove icons pinned to TaskBar | not work with system account
function UnPinFromTaskbar { 
    param( [string]$appname )
    Try {
            ((New-Object -Com Shell.Application).NameSpace('shell:::{4234d49b-0245-4df3-b780-3893943456e1}').Items() |
            ?{$_.Name -eq $appname}).Verbs() |
            ?{$_.Name -like "*arre des*" -OR $_.Name -like "Unpin from*"} |
            %{$_.DoIt()}
        }
    Catch {
        $_ | out-file d:\error_unPinTaskbar.log
    }
} 

# UnPinFromTaskbar
UnPinFromTaskbar("Internet Explorer")

#####################################################
# PendingReboot 
#####################################################

# https://docs.microsoft.com/en-us/azure/virtual-machines/extensions/custom-script-windows
# Tips and tricks
# 1) Don't put reboots inside the script. This action will cause problems with other extensions that are being installed,
#    and the extension won't continue after the reboot.
# 2) If you have a script that will cause a reboot before installing applications and running scripts, schedule the 
#    reboot by using a Windows Scheduled Task or by using tools such as DSC, Chef, or Puppet extensions.

# Remove PendingReboot
Restart-Computer
