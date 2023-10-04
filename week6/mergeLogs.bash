log1="/var/log/apache2/access.log"
log2="/var/log/apache2/access.log.1"
combined="logFiles.txt"

while read -r line
do
	echo "$line" >> "${combined}"
done < "$log1"

while read -r line
do
	echo "$line" >> "${combined}"
done < "$log2"
