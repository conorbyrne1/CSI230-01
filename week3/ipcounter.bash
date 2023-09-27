
ip=$(bash myfullip.bash | cut -c 1-10 | cut -d '/' -f 1)
end=$(bash prefixlength.bash)

filein=""
output=""

for i in {1..254}
	do
		#finein="$(printf %s ${ip} ${i} / ${end})"
		#echo "${filein}" >> ipoperations.txt
		output="${ip}""${i}""/""${end}"
		printf "${output}\n" >> ipoperations.txt
	done
