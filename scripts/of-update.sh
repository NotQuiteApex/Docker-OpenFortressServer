#!/usr/bin/env bash
# Updates Open Fortress.
declare -a u=( \
	"https://toast1.openfortress.fun/toast/" \
	"https://toast2.openfortress.fun/toast/" \
	"https://toast3.openfortress.fun/toast/" )

mup () {
	~/murse upgrade ~/server/sdk/open_fortress/ -u "$1"
}

vup () {
	~/murse verify ~/server/sdk/open_fortress/ -r -u "$1"
}

for str in ${u[@]}; do
	echo "Checking toast link: $str"
	mup "$str"
	if [ $? -ne 0 ]; then
		echo "Toast link failed, trying next..."
		continue
	fi
	echo "Verifying toast..."
	vup "$str"
	if [ $? -ne 0 ]; then
		echo "Toast verify failed, trying next..."
		continue
	fi
	echo "Verify success, exiting!"
	exit 0
done

echo "Failed to pull toast, failed..."
exit 1
