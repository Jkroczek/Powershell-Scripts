# Created by: JKroczek 5/19/17

$UserCredential = Get-Credential -Message 'Enter partner portal credentials:'
$Domain = Read-host -Prompt 'Enter primary domain (*.onmicrosoft.com):'

Write-Output 'When finished, use Remove-PSSession $Session to disconnect.'

# Enter partner portal user / password

$Session = New-PSSession -ConfigurationName Microsoft.Exchange -ConnectionUri https://ps.outlook.com/powershell-liveid?DelegatedOrg=$Domain -Credential $UserCredential -Authentication Basic -AllowRedirection

Import-PSSession $Session