#! /bin/bash
# Gives the ip address in 2-base

ip=$(bash myfullip.bash)

# First, dividing the IP into 4 parts from the dots

myip1=$(bash myfullip.bash | cut -d '.' -f 1)
myip2=$(bash myfullip.bash | cut -d '.' -f 2)
myip3=$(bash myfullip.bash | cut -d '.' -f 3)
myip4=$(bash myfullip.bash | cut -d '.' -f 4)

ip1binary=$(echo "obase=2;$myip1" | bc)
ip2binary=$(echo "obase=2;$myip2" | bc)
ip3binary=$(echo "obase=2;$myip3" | bc)
ip4binary=$(echo "obase=2;$myip4" | bc)

printf '%08d%08d%08d%08d\n' "$ip1binary" "$ip2binary" "$ip3binary" "$ip4binary"
