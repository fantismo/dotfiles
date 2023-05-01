#!/usr/bin/env bash

function oscheck() {

scriptinfo='
#:    Title: oscheck
#: Synopsis: test whether we are on a mac or linux for env / sys variables
#:     Date: 2016-11-29
#:  Version: 0.0.1
#:  Options:
'

	if [[ "$(uname -s)" == 'Darwin' ]]; then
		echo Darwin
	elif
		[[ "$(uname -s)" == 'Linux' ]]; then
		echo Linux
	else
		printf "  %s\n" "error: neither Darwin or Linux."
	fi
}

