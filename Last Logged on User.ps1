$computers = Get-ADComputer -Filter * | ForEach-Object {$_.Name}

foreach ($computer in $computers) {
    Get-ChildItem "\\$computer\c$\Users" | Sort-Object LastWriteTime -Descending | Select-Object Name, LastWriteTime -first 1
    }