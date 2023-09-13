#! /bin/bash
# Gives network address in binary

ip=$(bash myipbinary.bash)
pl=$(bash prefixlength.bash)
mask=$(bash mymaskbinary.bash)

network=""

for i in {1..32}
do
   if [[ "${ip:${i}-1:1}" -eq "${mask:${i}-1:1}" && "${i}" -le "${pl}" ]];
   then
   network+=1
   else
   network+=0
   fi

done

echo "$network"
