$Computers = Get-ADComputer -Filter * | select Name

ForEach ($Computer in $Computers) {
  (Get-WmiObject -Class Win32_Product -Filter "Name='Symantec Endpoint Protection'" -ComputerName $Computer).Uninstall()
}