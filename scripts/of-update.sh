#!/bin/sh
# Updates Open Fortress.

mup () {
	~/murse upgrade ~/server/sdk/open_fortress/ -u "https://toast.openfortress.fun/toast/"
}

vup () {
	~/murse verify ~/server/sdk/open_fortress/ -r -u "https://toast.openfortress.fun/toast/"
}

# Exit if all the alt urls fail.
mup "${u[0]}"
st0 = $?
vup "${u[1]}"
st1 = $?

if [$st0 -ne 0] && [$st1 -ne 0]; then
	exit 1
fi
