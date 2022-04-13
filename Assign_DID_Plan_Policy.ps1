$UserName = "<Email Address>"
$DID = "tel:15555555555"

Set-CsUser -Identity $UserName -OnPremLineUri $DID ; `
Set-CsUser -Identity $UserName -EnterpriseVoiceEnabled $True -HostedVoiceMail $True ; `

Grant-CsOnlineVoiceRoutingPolicy -Identity $UserName -PolicyName "<Policy>" ; `
Grant-CsTenantDialPlan -Identity $UserName -PolicyName "<Policy>" ; `
Grant-CsTeamsEmergencyCallRoutingPolicy -Identity $UserName -PolicyName "<Policy>" ; `
Grant-CsDialoutPolicy -Identity $UserName -PolicyName "<Policy>" ; `
Grant-CsOnlineVoicemailPolicy -Identity $UserName -PolicyName "<Policy>" ; `

Get-CSonlineUser -Identity $UserName | FL disp*,*mlineuri,*evoiceroutingp*,*tdialp*
