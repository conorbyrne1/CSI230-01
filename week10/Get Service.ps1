function select_service(){
cls

$theServices = Get-Service | select Name | Out-Host
#$theServices | Out-Host

$arr = @()

foreach ($tempServ in $theServices){
$arr += $tempServ
}

#$arr[0]

}
function get_service_logs(){
$someArray = @('all','All','Stopped', 'stopped', 'Running','running')

$readServ = Read-Host -Prompt `
"What do you want to do?`n a.) list all services (all)`n b.) list stopped services (Stopped)`n c.) list running services (Running) `n press q to quit (q)`n"

if($readServ -match "^[qQ]$"){
break
}
elseif($readServ -match $someArray[0] -or $readServ -match $someArray[1]){
Get-Service | select Name
}
elseif($readServ -match $someArray[2]-or $readServ -match $someArray[3]){
Get-Service | Where-Object {$_.Status -eq "Stopped"}
}
elseif($readServ -match $someArray[4]-or $readServ -match $someArray[5]){
Get-Service | Where-Object {$_.Status -eq "Running"}
}
else{
Write-Host "`n `n `n ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ `n Invalid value!! `n ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ `n `n `n"
get_service_logs
}

}
get_service_logs