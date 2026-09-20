# This changes local administration password
# https://learn.microsoft.com/en-us/powershell/module/microsoft.powershell.localaccounts/set-localuser?view=powershell-5.1
# Preuss 8/26/2023, 12/28/2023

whoami

# Request information from Human
$LOGON = Read-Host "Please enter the logon name of the local account to change password."

$PASSWORD = Read-Host "Please enter a secure password for this account."  -AsSecureString
$UserAccount = Get-LocalUser -Name $LOGON
$UserAccount | Set-LocalUser -Password $PASSWORD