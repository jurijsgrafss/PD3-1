$updates = winget upgrade | Select-String ">"

$count = $updates.Count

Write-Output "Sistema ir $count programmas, kuras nepieciesams atjauninat."
