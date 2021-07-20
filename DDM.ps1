Start-Process -FilePath ".\ddmsetup.exe" -ArgumentList "/Verysilent /NoUpdate"
Start-Sleep -s 10
Stop-process -Name ddm
Set-ItemProperty -Path “HKCU:\Software\EnTech\DDM” LastCheck -Value 0 –Force
Start-Process -FilePath "C:\Program Files (x86)\Dell\Dell Display Manager\ddm.exe"