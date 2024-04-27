# PowerShell

---

## List
|n|name|e.g.|O/P|
|-|----|----|---|
|1|Type VPN : S2S|`$policy = New-AzIpsecPolicy -IkeEncryption AES256 -IkeIntegrity SHA384 -DhGroup DHGroup24 -IpsecEncryption AES256 -IpsecIntegrity SHA256 -PfsGroup None -SALifeTimeSeconds 14400 -SADataSizeKilobytes 102400000`<br/><br/>`New-AzVirtualNetworkGatewayConnection -Name $Connection16 -ResourceGroupName $RG1 -VirtualNetworkGateway1 $vnetigw -LocalNetworkGateway2 $1ng6 -Location $Location1 -ConnectionType IPsec -IpsecPolicies $Spolicy -SharedKey 'AzureA1b2C3'`<br/><br/>Forced tunneling:<br/>`$force1 = Get-AzLocalNetworkGateway -Name "HQ" -ResourceGroupName "ForcedTunneling"`<br/>`$force2 = Get-AzVirtualNetworkGateway -Name "Gateway1" -ResourceGroupName "ForcedTunneling"`<br/><br/>`Set-AzVirtualNetworkGatewayDefaultSite -GatewayDefaultSite $force1 -VirtualNetworkGateway $force2`
|2|
