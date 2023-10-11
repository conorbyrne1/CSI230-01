log="logFiles.txt"
ip=""
theTime=""
requested=""
user=""

echo "" > web.html

echo "<html>" > web.html
echo "<body>" >> web.html
echo "<table>" >> web.html
echo "<tr>" >> web.html
echo "<th>IP</th>" >> web.html
echo "<th>Time</th>" >> web.html
echo "<th>Requested Page</th>" >> web.html
echo "<th>User Agent</th>" >> web.html
echo "</tr>" >> web.html
while read -r line
do
	echo "<tr>" >> web.html
	ip=$(echo "${line}" | cut -d ' ' -f1)
	echo "<td>${ip}</td>" >> web.html
	theTime=$(echo "${line}" | cut -d ':' -f2,3)
	echo "<td>${theTime}</td>" >> web.html
	requested=$(echo "${line}" | cut -d ' ' -f7)
	echo "<td>${requested}</td>" >> web.html
	user=$(echo "${line}" | cut -d ' ' -f12)
	echo "<td>${user}</td>" >> web.html
	echo "</tr>" >> web.html
done < "$log"
echo "</table>" >> web.html
echo "</body>" >> web.html
echo "</html>" >> web.html

cp web.html /var/www/html/web.html
