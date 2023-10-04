log="logFiles.txt"
ip=""
theTime=""
requested=""
user=""

echo "<html>" > web.html
echo "<body>" >> web.html
echo "<table>" >> web.html
echo "<tr>" >> web.html
echo "<th>IP</th>" >> web.hmtl
echo "<th>Time</th>" >> web.html
echo "<th>Requested Page</th>" >> web.html
echo "<th>User Agent</th>" >> web.html
echo "</tr>" >> web.hmtl
while read -r line
do
	echo "<tr>" >> web.html
	ip="${line}" | cut -d' ' -f1
	echo "<td>""${ip}""</td>" >> web.html
	theTime="${line}" | cut -d' ' -f4
	echo "<td>""${time}""</td>" >> web.html
#	requested="${line}" | cut
	echo "</tr>" >> web.html
done < "$log"
echo "</table>" >> web.html
echo "</body>" >> web.html
echo "</html>" >> web.html
