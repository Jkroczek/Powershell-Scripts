# Just a simple ping check to add into other scripts. Puts online computers into the $online array.
# Created by jkroczek 2/21/19

Import-Module ActiveDirectory

$computers = Get-ADComputer -Filter * | select -ExpandProperty Name # gets a list of all computers in AD, -ExpandProperty maintains the objects so the pipeline doesn't get broken
$online = @() # Declares $online as an array, probably not needed but eh why not

foreach ($computer in $computers){
  if (Test-Connection -ComputerName $computer -Count 1 -ErrorAction SilentlyContinue){
    $online += $computer
    }
}
Write-Host $online