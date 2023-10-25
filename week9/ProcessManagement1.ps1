#part1
$cProg=Get-Process -Name C* | Where-Object Name -ilike 'C*' | select Id, ProcessName, StartTime
Write-Host $cProg
Write-Host "---"

$date=Get-Date
#if($cProg StartTime -ge $date - 1 ) {
Write-Host $date
Write-Host "---"

$cTime="10/25/2023 2:30:00 PM"

Write-Host "---"
Get-Process -Name C* | Where-Object Name -ilike 'C*' | Where-Object StartTime -GT $cTime | select Id, ProcessName, StartTime