#!/usr/bin/env bash

# function to get ip address of host or domain
# usage: getip projector; getip google.com


function getip() {

theHOST="$1"

if [ ! -z "$theHOST" ]; then
	dig +short "$theHOST"
	return 0
	else
		printf "%s\n" "no host supplied - print usage here"
		return 1
fi

}