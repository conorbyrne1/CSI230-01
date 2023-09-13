#! /bin/bash

ip=$(bash myip.bash)
myipbinary=$(bash myipbinary.bash)
networkmask=$(bash mymaskbinary.bash)
networkbinary=$(bash mynetworkbinary.bash)


echo "Howdy! Please select an option:"
echo "1-Get my ip address"
echo "2-Get my ip address in binary"
echo "3-Get my network mask"
echo "4-Get my network mask in binary"
echo "5-Get my ip address"
echo "6-Quit"
read userInput

if [[ "${userInput}" -eq 1 ]]
	then echo "${ip}"
	fi
	exit 1
else if [[ "${userInput}" -eq 2 ]]
	then echo "${myipbinary}"
	fi
	exit 1
else if [[ "${userInput}" -eq 3 ]]
	then echo "${networkmask}"
	fi
	exit 1
else if [[ "${userInput}" -eq 4 ]]
	then echo "${networkbinary}"
	fi
	exit 1
else if [[ "${userInput}" -eq 5 ]]
	then $(bash convbin2ip.bash)
	fi
	exit 1
else
	 echo "Invalid input!"
	fi
	exit 1
