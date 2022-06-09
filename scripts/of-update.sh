#!/bin/sh
# Updates Open Fortress.

~/murse upgrade ~/server/sdk/open_fortress/ -u "https://toast3.openfortress.fun/toast/"
st0 = $?
~/murse verify ~/server/sdk/open_fortress/ -r -u "https://toast2.openfortress.fun/toast/"
st1 = $?

# Exit if all the alt urls fail.
if [$st0 -ne 0] && [$st1 -ne 0]; then
	exit 1
fi
