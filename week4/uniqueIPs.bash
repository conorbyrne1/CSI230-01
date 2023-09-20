ipList=$(bash getips.bash)
currentDate=$(date +"%d/%b/%Y")

echo "${ipList}" | cut -d ":" -f1 | sort | uniq -c | sort -nr
