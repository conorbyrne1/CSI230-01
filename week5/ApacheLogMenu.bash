input="/var/log/apache2/access.log.1"
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

function histogram()
{
#lastday=${((${currentDate}/24))
goodClient=$(cat "$ipList" | cat "${input}" | egrep 'HTTP/1.1" 200' | egrep '${currentDate}' | cut -d " " -f1)
echo "$goodClient" | sort | uniq -c | sort
}

function block()
{
echo "${badClients}" >> blacklisted.txt
}

function resetBlocks()
{
echo " " > blacklisted.txt
}

echo "[1] Number of Visitors"
echo "[2] Display Visitors"
echo "[3] Show Bad Visits"
echo "[4] Block Bad Visits"
echo "[5] Reset Bad Visits"
echo "[6] Show Visit Histogram"
echo "[7] Quit"
echo "Enter a number choice"
read userInput

if [ "${userInput}" -eq 1 ];
then
	listIPs
elif [ "${userInput}" -eq 2 ];
then
	visitors
elif [ "${userInput}" -eq 3 ];
then
	badClients
elif [ "${userInput}" -eq 4 ];
then
	block
elif [ "${userInput}" -eq 5 ];
then
	resetBlocks
elif [ "${userInput}" -eq 6 ];
then
	histogram
elif [ "${userInput}" -eq 7 ];
then
	return [n]
fi
