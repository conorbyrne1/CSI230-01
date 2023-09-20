
ip=$(bash myfullip.bash | cut -c 1-10 | cut -d '/' -f 1)
end=$(bash prefixlength.bash)

increment=""

for i in {1..254}
	do
		printf %s "${ip}" "${i}" "/" "${end}" '\n' > ipoperations.txt
		printf %s "${ip}" "${i}" "/" "${end} \n"
	done
