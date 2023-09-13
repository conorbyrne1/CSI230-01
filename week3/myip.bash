#! /bin/bash
# Get the IP address full from myfullip.bash as x.x.x.x/x
# returns the ip address without /x

ip=$(bash myfullip.bash | cut -d '/' -f 1)
echo "${ip}"
