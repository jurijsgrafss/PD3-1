# Proactive disk maintenance

$drive = Get-PSDrive C
$freePercent = ($drive.Free / ($drive.Free + $drive.Used)) * 100

$docPath = [Environment]::GetFolderPath("MyDocuments")
$logFile = Join-Path $docPath "Apkope.log"

$time = Get-Date -Format "yyyy-MM-dd HH:mm:ss"

if ($freePercent -lt 25) {

    $before = (Get-PSDrive C).Free

    Remove-Item "$env:TEMP\*" -Recurse -Force -ErrorAction SilentlyContinue
    Clear-RecycleBin -Force -ErrorAction SilentlyContinue

    $after = (Get-PSDrive C).Free
    $freedGB = ($after - $before) / 1GB

    $msg = "[$time] Tīrīšana veikta. Atbrīvoti {0:N2} GB." -f $freedGB
}
else {
    $msg = "[$time] Vieta pietiekama."
}

Add-Content -Path $logFile -Value $msg

Write-Output $msg
