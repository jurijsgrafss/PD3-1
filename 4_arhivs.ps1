$docPath = [Environment]::GetFolderPath("")
$errorsFile = Join-Path $docPath "Errors.txt"

$date = Get-Date -Format "yyyy-MM-dd"
$zipName = "Atskaite_$date.zip"
$zipPath = Join-Path $docPath $zipName

Compress-Archive -Path $errorsFile -DestinationPath $zipPath -Force

$sizeKB = (Get-Item $zipPath).Length / 1KB

Write-Output ("Arhiva izmers: {0:N2} KB" -f $sizeKB)
