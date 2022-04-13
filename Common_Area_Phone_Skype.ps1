his can be modified to create a Common Area Phone and assign a pin through powershell. Update the items that are in BOLD RED with the correct information. You will need to verify the following information before proceeding:
 

Line URI
Display Number
Display Name
Description
Registrar Pool      
 
Use the following command to check if the number is available:
 

Get-CsUser | where {$_.LineURI -eq "tel:+PhoneNumber" -or $_.PrivateLine -eq "tel:+PhoneNumber"} | Sort-Object LineURI | Select-Object Displayname, LineURI, PrivateLine
 

Set-CsClientPin -Identity "IDENTITY" -Pin 123123


If this does not provide a result it should be available to be used

Get-CsCommonAreaPhone provides all common area phones

---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
 

New-CsCommonAreaPhone -LineUri tel:+15555555555 -RegistrarPool POOLNAME -Description "NAME OF PHONE" -DisplayName "NAME OF PHONE" -OU "OU=FILL IN,OU=FILL IN,DC=FILL IN,DC= FILL IN"


---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

 

#Commands to check if number is assigned

Get-CsUser | where {$_.LineURI -eq $PhoneNumber -or $_.PrivateLine -eq $PhoneNumber} | Sort-Object LineURI | Select-Object Displayname, LineURI, PrivateLine

Get-CsCommonAreaPhone | where {$_.LineURI -eq $PhoneNumber} | Sort-Object LineURI | Select-Object Identity, LineURI, DisplayNumber, DisplayName, Description

Get-CsRgsWorkflow | where {$_.LineURI -eq $PhoneNumber} | Sort-Object LineURI | Select-Object Name, Identity, LineURI, DisplayNumber, Description

Get-CsExUmContact | where {$_.LineURI -eq $PhoneNumber} | Sort-Object LineURI | Select-Object identity, LineURI

Get-CsAnalogDevice | where {$_.LineURI -eq $PhoneNumber} | Sort-Object LineURI | Select-Object identity, LineURI

#Use to disable CsUser is they are still attached to the number being provided but no longer are active.

Disable-CsUser -Identity "UserName"



$PhoneNumber = tel:+15555555555

$RegPool = Lync2013Pool.pnwboces.org

$DescNameIdent = "TEST COMMON AREA PHONE"

$OrganizationalUnit = "OU=Phones,DC=pnwboces,DC=edu"

$Identity = "CN="+$DescNameIdent+$OrganizationalUnit

$DisplayNum = "(555) 555-5555"

$PinNumber = 123123


Set-CsClientPolicy -Identity Global -EnableHotdesking $TRUE ; `

New-CsCommonAreaPhone -LineUri $PhoneNumber `

-RegistrarPool $RegPool `

-OU $OrganizationalUnit `

-Description $DescNameIdent `

-DisplayName $DescNameIdent `

-DisplayNumber $DisplayNum ; `

Get-CsClientPinInfo -Identity $Identity | Set-CsClientPin –Identity $Identity -Pin $PinNumber ; `

Get-CsCommonAreaPhone -Filter {DisplayName -eq $DescNameIdent} ; Get-CsClientPinInfo -Identity $Identity | Format-Table -AutoSize
