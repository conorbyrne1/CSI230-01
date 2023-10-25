# Get IPv4 Address from ethernet interface
(Get-NetIPAddress -AddressFamily IPv4 | where {$_.InterfaceAlias -ilike "Ethernet*" }).IPAddress

#get IPv4 PrefixLength from Ethernet Interface
(Get-NetIPAddress -AddressFamily IPv4 | where {$_.InterfaceAlias -ilike "Ethernet*"}).PrefixLength

#Show me what classes there is of Win32 library that starts with net
# - Sort alphabetically
Get-WmiObject -List | where { $_.Name -ilike "Win32_[n][e][t]*" } | Sort-Object

# Get DHCP Server IP 
# - Hide the table headers
Get-CimInstance Win32_NetworkAdapterConfiguration  -Filter "DHCPEnabled=$True" | `
select DefaultIPGateway | Format-Table -HideTableHeaders

#Get DNS Server IPs for Ethernet interface and only display the first one
(Get-DnsClientServerAddress -AddressFamily IPv4 | `
where {$_.InterfaceAlias -ilike "Ethernet*"}).ServerAddresses[0]

#directory
cd "C:\Users\champuser\CSI230-01\week9"

#list based on file name
$files=(dir -Recurse)
for($j=0; $j -le $files.Count; $j++){

    if($files[$j].Extension -ilike "*ps1"){
        $files[$j].Name
    }
}

#create folder
$folderPath = "C:\Users\champuser\CSI230-01\week9\outfolder"
if(Test-Path -Path $folderPath){
    Write-Host "Folder Already Exists"
}
else{
New-Item -Name "outfolder" -ItemType Directory -Path $folderPath
}

#10
cd "C:\Users\champuser\CSI230-01\week9"
$files=(dir -Recurse)

$folderPath = "C:\Users\champuser\CSI230-01\week9\outfolder"
$filePath = Join-Path $folderPath "out.csv"
#List all the files that have .ps1 extension to out.csv
$files | Where-Object { $_.Extension -like ".ps1" } | `
Export-Csv -Path $filePath

#change every .csv to .log
$files=Get-ChildItem -Recurse -File
$files | Rename-Item -NewName { $_.Name -Replace '.csv','.log' }