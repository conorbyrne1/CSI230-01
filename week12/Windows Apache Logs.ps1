clear

#list all of the apaches logs of xampp
#Get-Content C:\xampp\apache\logs\access.log -Tail 5

#list all of the apaches logs of xampp
#Get-Content C:\xampp\apache\logs\access.log | Select-String ' 404 ',' 400 '

#list all of the apaches logs of xampp excluding 200 
$B = Get-Content C:\xampp\apache\logs\access.log | Select-String ' 200 ' -NotMatch

#From every .log file in the directory, only get logs that contain the word 'error'
$A = Get-Content C:\xampp\apache\logs\*.log | Select-String -AllMatches 'error'
#print last 5
#$A[-5..-1]

$regex = [regex] `
"(?:(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.){3}(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)"
$ips = $regex.Matches($B) | select @{Name="IP"; Expression={ $_.value }}
#$ips

$counts = $ips | Group-Object IP -NoElement
#$counts

$countsDetailed = $counts | Select-Object Count, Name, `
@{Name="Decision"; Expression={if($_.Count -gt 3) {"Abnormal"} `
                              else {"Normal"} `
                               }}
#$countsDetailed

#block ips if ip is abnormal
foreach($ip in $countsDetailed){

    if([string]$ip.Decision -ilike "Abnormal") {
    Write-Host "Blocking $ip.Name"
    New-NetFirewallRule -DisplayName "Bad IPs $ip.Name" `
    -Direction Inbound -Action Block -RemoteAddress $ip.Name
    }

}
#remove created firewall rules
Remove-NetFirewallRule -DisplayName "Bad IPs*"