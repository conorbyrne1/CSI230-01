ipList=$(bash /home/cbyrne/CSI230-01/week4/getips.bash)
currentDate=$(date +"%d/%b/%Y")

echo "${ipList}" | cut -d ":" -f1 | sort | uniq -c | sort -nr >> clientIPs.txt

