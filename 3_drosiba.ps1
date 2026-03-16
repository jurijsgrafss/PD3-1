$status = Get-MpComputerStatus

$rt = $status.RealTimeProtectionEnabled
$scanAge = $status.QuickScanAge

if (-not $rt -or $scanAge -gt 3) {
    Write-Host "Sistēma ir apdraudēta!" -ForegroundColor Red
}
else {
    Write-Host "Sistēma ir droša." -ForegroundColor Green
}
