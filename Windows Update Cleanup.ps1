# Created by jkroczek 10/25/18

Get-Service wuauserv | Stop-Service
Get-Service bits | Stop-Service

Get-ChildItem -path C:\Windows\SoftwareDistribution -Filter * -Recurse | Remove-Item -Recurse -Force

Get-Service wuauserv | Start-Service
Get-Service bits | Start-Service