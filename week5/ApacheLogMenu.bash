input="/var/log/apache2/access.log"
ipList="clientIPs.txt"
currentDate=$(date +"%d/%b/%Y")
currentHour=$(date +"%H")
currentMinute=$(date +"%M")


function listIPs()
{
printf "" > clientIPs.txt
ipList=""
temp=$(cat "$input" | cut -d " " -f1)
echo "${temp}" | sort | uniq | sort >> clientIPs.txt
}

function visitors()
{
goodVisitor=$(cat "$ipList" | cat "${input}" | grep "${currentDate}" | cut -d " " -f1)

echo "$goodVisitor" | sort | uniq -c | sort
}

function badClients()
{
lastTenMin=$((${currentMinute}/10))
badClient=$(cat "$ipList" | cat "${input}" | egrep 'HTTP/1.1" 40[0-4]' | egrep '${currentDate}:${currentHour}:${lastTenMin}[0-9]' | cut -d " " -f1)

echo "$badClient" | sort | uniq -c | sort
}
echo "Enter a number choice"
read userInput

if [ "${userInput}" -eq 0 ];
then
	listIPs
elif [ "${userInput}" -eq 1 ];
then
	visitors
elif [ "${userInput}" -eq 2 ];
then
	badClients
fi
