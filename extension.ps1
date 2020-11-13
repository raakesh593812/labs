get-azvm | foreach-object {
 Get-AzVMExtension -ResourceGroupName $_.ResourceGroupName -VMName $_.name | select vmname,name ,ResourceGroupName | foreach-object {
if ($_.name -eq 'MicrosoftMonitoringAgent'){
write-host "its windows" -f yellow
$pubse = Get-AzVMExtension -ResourceGroupName $_.ResourceGroupName -VMName $_.vmname -name MicrosoftMonitoringAgent -verbose | select PublicSettings
 $law = Get-AzOperationalInsightsWorkspace | Where-Object {$_.CustomerId -eq (($pubse.PublicSettings | convertfrom-json).workspaceId) } | select Name
write-host $_.vmname $_.ResourceGroupName $law.name
}
elseif ($_.name -eq 'OMSAgentForLinux'){
write-host "its linux" -f yellow
$pubse = Get-AzVMExtension -ResourceGroupName $_.ResourceGroupName -VMName $_.vmname -name OMSAgentForLinux -verbose | select PublicSettings
 $law = Get-AzOperationalInsightsWorkspace | Where-Object {$_.CustomerId -eq (($pubse.PublicSettings | convertfrom-json).workspaceId) } | select Name
write-host $_.vmname $_.ResourceGroupName $law.name
}



 }


}
__________________________________________

$lawsname = 'testlaws01'
get-azvm | foreach-object {
 Get-AzVMExtension -ResourceGroupName $_.ResourceGroupName -VMName $_.name | select vmname,name ,ResourceGroupName | foreach-object {
if ($_.name -eq 'MicrosoftMonitoringAgent'){
#write-host "its windows" -f yellow
$pubse = Get-AzVMExtension -ResourceGroupName $_.ResourceGroupName -VMName $_.vmname -name MicrosoftMonitoringAgent -verbose | select PublicSettings
 $law = Get-AzOperationalInsightsWorkspace | Where-Object{ $_.name -eq $lawsname} | Where-Object {$_.CustomerId -eq (($pubse.PublicSettings | convertfrom-json).workspaceId) } | select Name
write-host $_.vmname #$_.ResourceGroupName $law.name
}
elseif ($_.name -eq 'OMSAgentForLinux'){
#write-host "its linux" -f yellow
$pubse = Get-AzVMExtension -ResourceGroupName $_.ResourceGroupName -VMName $_.vmname -name OMSAgentForLinux -verbose | select PublicSettings
 $law = Get-AzOperationalInsightsWorkspace | Where-Object{ $_.name -eq $lawsname} | Where-Object {$_.CustomerId -eq (($pubse.PublicSettings | convertfrom-json).workspaceId) } | select Name
write-host $_.vmname #$_.ResourceGroupName $law.name
}



 }


}
