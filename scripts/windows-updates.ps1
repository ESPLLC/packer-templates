$ProgressPreference='SilentlyContinue'

Import-Module PSWindowsUpdate
Get-WindowsUpdate -Install -WindowsUpdate -AcceptAll -UpdateType Software -IgnoreReboot
