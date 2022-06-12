#!/usr/bin/env bash
# Updates Open Fortress.
declare -a u=( \
	"https://toast.openfortress.fun/toast" \
	"https://toast1.openfortress.fun/toast/" \
	"https://toast2.openfortress.fun/toast/" \
	"https://toast3.openfortress.fun/toast/" )

for str in ${u[@]}; do
	echo "Checking toast link: $str"
	./murse upgrade ./sdk/open_fortress/ -u "$str"
	if [ $? -ne 0 ]; then
		echo "Toast link failed, trying next..."
		continue
	fi
	echo "Download complete."
	# Verifying is disabled for now until .murse_ignore is implemented and can
	# properly ignore important files like gameinfo.txt being edited as necessary.
	#echo "Verifying toast..."
	#./murse verify ./sdk/open_fortress/ -r -u "$str"
	#if [ $? -ne 0 ]; then
	#	echo "Toast verify failed, trying next..."
	#	continue
	#fi
	#echo "Verify success, exiting!"
	exit 0
done

echo "Failed to pull toast, exiting..."
exit 1
