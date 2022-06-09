#!/bin/sh
# Updates Open Fortress.
declare -a u=( \
	"https://toast1.openfortress.fun/toast/" \
	"https://toast2.openfortress.fun/toast/" \
	"https://toast3.openfortress.fun/toast/" )

mup () {
	~/murse upgrade ~/server/sdk/open_fortress/ -u "$arg1"
}

vup () {
	~/murse verify ~/server/sdk/open_fortress/ -u "$arg1" -r
}

# Exit if all the alt urls fail.
mup "${u[0]}" || vup "${u[1]}" || vup "${u[2]}" || exit 1
