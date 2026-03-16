$status = Get-MpComputerStatus

$rt = $status.RealTimeProtectionEnabled
$scanAge = $status.QuickScanAge

if (-not $rt -or $scanAge -gt 3) {
    Write-Host "Sistema ir apdraudeta!" -ForegroundColor Red
}
else {
    Write-Host "Sistema ir drosa." -ForegroundColor Green
}
