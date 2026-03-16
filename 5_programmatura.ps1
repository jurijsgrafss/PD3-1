# Check for available software updates using winget

$updates = winget upgrade | Select-String ">"

$count = $updates.Count

Write-Output "Sistēmā ir $count programmas, kuras nepieciešams atjaunināt."
