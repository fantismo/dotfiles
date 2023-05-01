#!/usr/bin/env bash

function durh() {
description='
#:    Title: durh
#: Synopsis: prints contents of directory sorted by size (high to low)
#:     Date: 2016-11-15
#:  Version: 0.0.7
'
	#: calculates the size of all items in a directory and prints
	#: results sorted by size (greatest to least)
	#: usage: durh /path/to/dir
	local theDir=$(realpath $1)
	printf "\n %s\n" "$theDir"
	local theOutput=$(printf "  %5s   %-11s\n" $(du -hs "${theDir}"/* | gsort -hr))
	echo "$theOutput"
	echo
}
