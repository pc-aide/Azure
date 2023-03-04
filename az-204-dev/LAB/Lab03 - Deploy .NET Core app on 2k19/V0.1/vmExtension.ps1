<#
  Time: ~5m
#>

#####################################################
#   VARIABLES   
#####################################################



#####################################################
# FIlES in D:\ 
#####################################################



#####################################################
# INSTALL APPS 
#####################################################



#####################################################
#  ENV PATH
#####################################################



#####################################################
#  CUSTOM OS   
#####################################################

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
