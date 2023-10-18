cd C:\Users\champuser\CSI230-01\week8\

clear

Get-EventLog -list

$readLog = Read-Host -Prompt "Please select a Log to export"

Get-EventLog -LogName $readLog -Newest 3 | export-csv -NoTypeInformation -Path "C:\Users\champuser\CSI230-01\week8\rep.csv"