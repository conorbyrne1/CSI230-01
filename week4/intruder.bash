for i in {1..20}
	do
		curl 184.171.148.139/helloworld.html > /dev/null 2>&1
		echo "accessed ${i} times!"
	done
