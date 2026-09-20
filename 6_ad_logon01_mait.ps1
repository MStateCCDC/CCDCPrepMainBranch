# This will create all logons
# The information is from ad_logon01.csv 
# The admin_logon tab from the AD_master spreadsheet 
# The file must be in the same directory we run the PowerShell script
# http://ss64.com/ps/new-aduser.html
# http://social.technet.microsoft.com/Forums/windowsserver/en-US/15918f11-9173-4ca9-a575-bb965faa86b0/newaduser-and-importing-from-csv-with-null-fields?forum=winserverpowershell
# Recommend set True or False values in code for now, otherwise need system convert
# Preuss
# 8/10/2014
# Recommend commnent out the unused lines
# Added group creation, 12/7/2015

# This imports the necessary module
Import-Module ActiveDirectory

Import-csv .\ad_logon01_mait.csv | ForEach-Object {
	# This will set some variables
    $path01 = "dc=" + $_.DC1 + ",dc=" + $_.DC2 + ",dc=" + $_.DC3
    $path02 = "ou=" + $_.OU + ",dc=" + $_.DC1 + ",dc=" + $_.DC2 + ",dc=" + $_.DC3

    $id01= "cn=" + $_.Name + ",ou=" + $_.OU + ",dc=" + $_.DC1 + ",dc=" + $_.DC2 + ",dc=" + $_.DC3
    $id02= "cn=" + $_.Name02 + ",ou=" + $_.OU + ",dc=" + $_.DC1 + ",dc=" + $_.DC2 + ",dc=" + $_.DC3

    $group01="cn=" + $_.Group01 + ",ou=" + $_.OU + ",dc=" + $_.DC1 + ",dc=" + $_.DC2 + ",dc=" + $_.DC3
    $group02="cn=" + $_.Group02 + ",ou=" + $_.OU + ",dc=" + $_.DC1 + ",dc=" + $_.DC2 + ",dc=" + $_.DC3	
    $group03="cn=" + $_.Group03 + ",ou=" + $_.OU + ",dc=" + $_.DC1 + ",dc=" + $_.DC2 + ",dc=" + $_.DC3
    $group04="cn=" + $_.Group04 + ",ou=" + $_.OU + ",dc=" + $_.DC1 + ",dc=" + $_.DC2 + ",dc=" + $_.DC3

	
	# This will create the new logons
	New-ADUser  $_.Name -SamAccountName $_.SamAccountName -Path $path02

	# This modifies the new logons
	Set-ADUser $id01 -AccountExpirationDate $_.AccountExpirationDate
	Set-ADuser $id01 -AccountNotDelegated   ([System.Convert]::ToBoolean($_.AccountNotDelegated)) 
	Set-ADuser $id01 -AllowReversiblePasswordEncryption  ([System.Convert]::ToBoolean($_.AllowReversiblePasswordEncryption))
	#Set-ADuser $id01 -AuthType $_.AuthType
	Set-ADuser $id01 -CannotChangePassword  ([System.Convert]::ToBoolean($_.CannotChangePassword))
	#Set-ADuser $id01 -Certificates $_.Certificates
	Set-ADuser $id01 -ChangePasswordAtLogon  ([System.Convert]::ToBoolean($_.ChangePasswordAtLogon))
	Set-ADuser $id01 -City $_.City
	#Set-ADuser $id01 -Clear $_.Clear
	Set-ADuser $id01 -Company $_.Company
	#Set-ADuser $id01 -Confirm $_.Confirm
	Set-ADuser $id01 -Country $_.Country
	#Set-ADuser $id01 -Credential $_.Credential
	Set-ADuser $id01 -Department $_.Department
	Set-ADuser $id01 -Description $_.Description
	Set-ADuser $id01 -DisplayName $_.DisplayName
	Set-ADuser $id01 -Division $_.Division
	Set-ADuser $id01 -EmailAddress $_.EmailAddress
	Set-ADuser $id01 -EmployeeID $_.EmployeeID
	Set-ADuser $id01 -EmployeeNumber $_.EmployeeNumber
	#Set-ADuser $id01 -Fax $_.Fax
	Set-ADuser $id01 -GivenName $_.GivenName
	Set-ADuser $id01 -HomeDirectory $_.HomeDirectory
	Set-ADuser $id01 -HomeDrive $_.HomeDrive
	Set-ADuser $id01 -HomePage $_.HomePage
	#Set-ADuser $id01 -HomePhone $_.HomePhone
	#Set-ADuser $id01 -Initials $_.Initials
	#Set-ADuser $id01 -LogonWorkstations $_.LogonWorkstations
	#Set-ADuser $id01 -Manager $_.Manager
	#Set-ADuser $id01 -MobilePhone $_.MobilePhone
	Set-ADuser $id01 -Office $_.Office
	#Set-ADuser $id01 -OfficePhone $_.OfficePhone
	Set-ADuser $id01 -Organization $_.Organization
	#Set-ADuser $id01 -OtherName $_.OtherName
	# Set-ADuser $id01 -Partition $_.Partition
	# Set-ADuser $id01 -PassThru $_.PassThru
	Set-ADuser $id01 -PasswordNeverExpires  ([System.Convert]::ToBoolean($_.PasswordNeverExpires))
	Set-ADuser $id01 -PasswordNotRequired  ([System.Convert]::ToBoolean($_.PasswordNotRequired))
	#Set-ADuser $id01 -POBox $_.POBox
	Set-ADuser $id01 -PostalCode $_.PostalCode
	# Set-ADuser $id01 -ProfilePath $_.ProfilePath
	# Set-ADuser $id01 -Remove $_.Remove
	# Set-ADuser $id01 -Replace $_.Replace
	#Set-ADuser $id01 -ScriptPath $_.ScriptPath
	#Set-ADuser $id01 -ServicePrincipalNames $_.ServicePrincipalNames
	Set-ADuser $id01 -SmartCardlogonRequired  ([System.Convert]::ToBoolean($_.SmartCardlogonRequired))
	Set-ADuser $id01 -State $_.State
	Set-ADuser $id01 -StreetAddress $_.StreetAddress
	Set-ADuser $id01 -Surname $_.Surname
	Set-ADuser $id01 -Title $_.Title
	Set-ADuser $id01 -TrustedForDelegation  ([System.Convert]::ToBoolean($_.TrustedForDelegation))
	Set-ADuser $id01 -UserPrincipalName $_.UserPrincipalName
	# Set-ADuser $id01 -Whatif $_.Whatif

 # This section creates the groups
    New-ADGroup -Name $group01 -SamAccountName $_.Gsamid01 -GroupCategory $_.GroupCategory01 -GroupScope $_.GroupScope01 -DisplayName $_.GDisplayName01 -Path $path02 -Description $_.GDescription01
    New-ADGroup -Name $group02 -SamAccountName $_.Gsamid01 -GroupCategory $_.GroupCategory01 -GroupScope $_.GroupScope01 -DisplayName $_.GDisplayName01 -Path $path02 -Description $_.GDescription01
    #New-ADGroup -Name $group03 -SamAccountName $_.Gsamid01 -GroupCategory $_.GroupCategory01 -GroupScope $_.GroupScope01 -DisplayName $_.GDisplayName01 -Path $path02 -Description $_.GDescription01
    #New-ADGroup -Name $group04 -SamAccountName $_.Gsamid01 -GroupCategory $_.GroupCategory01 -GroupScope $_.GroupScope01 -DisplayName $_.GDisplayName01 -Path $path02 -Description $_.GDescription01


	# This section sets the group memberships
	Add-ADGroupMember $group01 -Members $id01
	Add-ADGroupMember $group02 -Members $id01
	Add-ADGroupMember $group02 -Members $id01
	Add-ADGroupMember $group04 -Members $id01

	# This section sets the password and enables the account
	Set-ADAccountPassword $id01 -Reset -NewPassword (ConvertTo-SecureString -AsPlainText $_.NewPassword -Force)
	Set-ADuser $id01 -Enabled   ([System.Convert]::ToBoolean($_.Enabled))

	}

# http://blog.danskingdom.com/allow-others-to-run-your-powershell-scripts-from-a-batch-file-they-will-love-you-for-it/

# If running in the console, wait for input before closing.
if ($Host.Name -eq "ConsoleHost")
{
    Write-Host "Press any key to continue..."
    $Host.UI.RawUI.FlushInputBuffer()   # Make sure buffered input doesn't "press a key" and skip the ReadKey().
    $Host.UI.RawUI.ReadKey("NoEcho,IncludeKeyUp") > $null
}
 

 

# If running in the console, wait for input before closing.
if ($Host.Name -eq "ConsoleHost")
{
    Write-Host "Press any key to continue..."
    $Host.UI.RawUI.FlushInputBuffer()   # Make sure buffered input doesn't "press a key" and skip the ReadKey().
    $Host.UI.RawUI.ReadKey("NoEcho,IncludeKeyUp") > $null
}
