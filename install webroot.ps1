#  Script copies Webroot installer from my local C:\ to the remote computer and installs it.
#  Created by jkroczek 2/19/19

#Gets list of Computers in active directory and puts them into $computers
Import-Module activedirectory
$Computers = Get-ADComputer -Filter * | select Name

#Copies the webroot installer and executes it with msiexec
foreach ($Computer in $Computers) {
  Copy-Item C:\wsasme.msi -Destination \\$Computer\C$
  Invoke-Command -ComputerName $Computer  -ScriptBlock {Start-Process msiexec.exe -Wait -ArgumentList '/I C:\wsasme.msi /qn'}
}