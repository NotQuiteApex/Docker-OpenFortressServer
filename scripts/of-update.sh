#!/usr/bin/env bash
# Updates Open Fortress.
declare -a u=( \
	"https://toast1.openfortress.fun/toast/" \
	"https://toast2.openfortress.fun/toast/" \
	"https://toast3.openfortress.fun/toast/" )

for str in ${u[@]}; do
	echo "Checking toast link: $str"
	~/murse upgrade ~/server/sdk/open_fortress/ -u "$str"
	if [ $? -ne 0 ]; then
		echo "Toast link failed, trying next..."
		continue
	fi
	echo "Verifying toast..."
	~/murse verify ~/server/sdk/open_fortress/ -r -u "$str"
	if [ $? -ne 0 ]; then
		echo "Toast verify failed, trying next..."
		continue
	fi
	echo "Verify success, exiting!"
	exit 0
done

echo "Failed to pull toast, exiting..."
exit 1
