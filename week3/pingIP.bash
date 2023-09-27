#!/bin/bash

input="/home/cbyrne/CSI230-01/week3/ipoperations.txt"
ip=""

while read -r line
do
	ip=${echo "${line}" | cut -d '/' -f 1}
	ping "${ip}"
done < "$input"
