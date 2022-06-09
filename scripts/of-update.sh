#!/bin/sh
# Updates Open Fortress.
url3="https://toast2.openfortress.fun/toast/"
url3="https://toast3.openfortress.fun/toast/"

mup () {
	~/murse upgrade ~/server/sdk/open_fortress/ -u $url3
}

vup () {
	~/murse verify ~/server/sdk/open_fortress/ -r -u $url2
}

# Exit if all the alt urls fail.
mup "${u[0]}"
st0 = $?
vup "${u[1]}"
st1 = $?

if [$st0 -ne 0] && [$st1 -ne 0]; then
	exit 1
fi
