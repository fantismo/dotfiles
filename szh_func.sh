#!/usr/bin/env bash

function szh() {
	#: print the number of items and storage requirements of a directory
	#: usage: szh /path/to/dir
	printf "%s \t %s \t %s\n" $(ls -1 $1 | wc -l) $(du -hs $1) | awk '{ print "   "$3"\t"$1"\t"$2 }'
}
