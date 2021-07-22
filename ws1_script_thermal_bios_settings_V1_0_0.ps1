# WS1 BIOS Thermal Profile as Dell Command Monitor script for Powershell execution
# Author: Sven Riebe Twitter: @SvenRiebe
# Version: 1.0
# Status: Test

# If you have BIOS PW on this device put in here the pw for authorization
$adminpw = "Password1234!"

#Start logging
Start-Transcript -Path "C:\temp\thermalsetting.txt" -Append

#checking exiting value
Get-CimInstance -Namespace root\dcim\sysman -ClassName dcim_biosenumeration -Filter "AttributeName='Thermal Management'" | select Currentvalue


#Power Profile Manger in BIOS 1 = Optimized, 2 = Cool, 3 = Quiet, 4 = UltraPerformance   set to Quite slient Fan for Latitude
Get-CimInstance -Namespace root\dcim\sysman -ClassName DCIM_BIOSService | Invoke-CimMethod -MethodName SetBIOSAttributes -Arguments @{AttributeName=@("Thermal Management");AttributeValue=@("3");AuthorizationToken=$adminpw}

#checking value again
Get-CimInstance -Namespace root\dcim\sysman -ClassName dcim_biosenumeration -Filter "AttributeName='Thermal Management'" | select Currentvalue


#Stop logging
Stop-Transcript
