# Script to enable RDP for workstations
# Note: PS-Remoting must be enabled first (This is already done via GPO)
# Created by jkroczek 3/18/20

$Computer = Read-Host 'Input Computer name: '
Invoke-Command -ComputerName $Computer -ScriptBlock {
    Set-ItemProperty -Path 'HKLM:SystemCurrentControlSetControlTerminal Server'-name "fDenyTSConnections" -Value 0;
    try {
        Enable-NetFirewallRule -DisplayGroup "Remote Desktop" -ErrorAction Stop
    }
    catch {
        # Enables this the old way if the Remote Desktop group doesn't exist for some reason.
        netsh advfirewall firewall add rule name="allow RemoteDesktop" dir=in protocol=TCP localport=3389 action=allow
    }
}