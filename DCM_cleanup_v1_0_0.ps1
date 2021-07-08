###################################################################################################
#
# Name: Dell Command Monitor cleanup
#
# Author: Sven Riebe
#
# Status: validate
#
# Version: 1.0.0
#
# Date: 07-08-2021
#
# Success check for WS1 regkey version: Computer\HKEY_LOCAL_MACHINE\SOFTWARE\Dell Computer Corporation\Dell OMSA\CurrentVersion Value:Version Value data:10.5.1

# find all apps with Command Monitor
$software = Get-WmiObject -Class win32_product -Filter "Name ='Dell Command | Monitor'"

# uninstall these software
$software.uninstall()

# short wait before installation is start.
Start-Sleep -Seconds 5

# WS1 is save the .exe in a cache folder so we need on specific path but you can change if you need.
Start-Process -FilePath ".\Dell-Command-Monitor_6R88F_WIN_10.5.1.114_A00.EXE" -ArgumentList "/S"

# give windows time to finialized the installation first, we need to secure that the regkey we new version is availble.
Start-Sleep -Seconds 10