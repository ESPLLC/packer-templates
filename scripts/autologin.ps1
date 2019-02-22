$WinlogonPath = "HKLM:\Software\Microsoft\Windows NT\CurrentVersion\Winlogon"
Set-ItemProperty -Path $WinlogonPath -Name AutoAdminLogon -Value 1
Set-ItemProperty -Path $WinlogonPath -Name ForceAutoLogon -Value 1
Set-ItemProperty -Path $WinlogonPath -Name DefaultUsername -Value "vagrant"
Set-ItemProperty -Path $WinlogonPath -Name DefaultPassword -Value "vagrant"

Get-ItemProperty -Path $WinlogonPath -Name AutoAdminLogon
Get-ItemProperty -Path $WinlogonPath -Name ForceAutoLogon
Get-ItemProperty -Path $WinlogonPath -Name DefaultUsername
Get-ItemProperty -Path $WinlogonPath -Name DefaultPassword

# Reset trial period cmd?
# slmgr -rearmpause