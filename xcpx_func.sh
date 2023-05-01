#!/usr/bin/env bash

function xcpx() {
	#: copy stdout and remove newline / trailing spaces
	#: usage: pwd -P | xcpx
	read input
	local input="$(echo $input | tr '\n' ' ')"
	input="${input//[[:space:]]/}"
	printf "%s" "$input" | /usr/bin/pbcopy
	if [ $? -eq 0 ]; then
		printf "  %s\n" "copied: $(/usr/bin/pbpaste)" && return 0
	else
		printf "  %s\n" "error copying input" && return 1
	fi
}
