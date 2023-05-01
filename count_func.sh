#!/usr/bin/env bash

# script metadata; these are accessed by common functions

scriptinfo='
#:    Title: count
#: Synopsis: count the number of files in the current directory
#:     Date: 2016-09-03
#:  Version: 0.0.1
#:  Options:
'

scriptname=${0##*/}
description="count the number of files in the current directory"
usage="$scriptname [opts]"
date_of_creation=2016-09-03
updated=2016-09-03
version=0.0.1

count() {
	ls -1 . | wc -l
}

