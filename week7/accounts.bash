#! /bin/bash

function help()
{
echo "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
echo "accounts.bash only accepts -d or -c"
echo "you either entered nothing or the wrong thing"
echo "ex: accounts.bash -d or accounts.bash -c"
echo "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
}

userInput=$1

if [ "${userInput}" != "-d" ] && [ "${userInput}" != "-c" ]; then
help
exit;
fi 

shadow="/etc/shadow"
users=$(cat "$shadow" | grep -v ":!:" | cut -d ":" -f1)

username=$(cat "usr.txt")

while getopts ":dc" option; do
	case $option in
	d) #get disabled accounts
	echo "disabled accounts:"
	echo "${users}"
	;;
	c) #count logins of user
	loginCount=$(last "$username" | cut -d " " -f1)
	echo "${loginCount}" | sort | uniq -c | grep "${username}"
	;;
	esac
done
