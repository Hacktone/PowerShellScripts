#Simple PS Command to create a new user in Azure AD
$PasswordProfile = New-Object -TypeName Microsoft.Open.AzureAD.Model.PasswordProfile ;
$PasswordProfile.Password = "<Password>" ;
New-AzureADUser -AccountEnabled $True -DisplayName "Abby Brown" -PasswordProfile $PasswordProfile -MailNickName "AbbyB" -UserPrincipalName "AbbyB@contoso.com"
