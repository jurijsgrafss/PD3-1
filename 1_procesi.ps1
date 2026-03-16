$procesi = Get-Process | Where-Object {$_.ProcessName -ne "svchost"} |
Sort-Object WorkingSet -Descending |
Select-Object -First 5

$totalRAM = ($procesi | Measure-Object WorkingSet -Sum).Sum / 1MB

Write-Output ("Top 5 procesu total RAM: {0:N1} MB" -f $totalRAM)