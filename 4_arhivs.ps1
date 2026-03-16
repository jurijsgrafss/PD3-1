# Create archive of Errors.txt with current date

$docPath = [Environment]::GetFolderPath("MyDocuments")
$errorsFile = Join-Path $docPath "Errors.txt"

$date = Get-Date -Format "yyyy-MM-dd"
$zipName = "Atskaite_$date.zip"
$zipPath = Join-Path $docPath $zipName

Compress-Archive -Path $errorsFile -DestinationPath $zipPath -Force

$sizeKB = (Get-Item $zipPath).Length / 1KB

Write-Output ("Arhīva izmērs: {0:N2} KB" -f $sizeKB)
