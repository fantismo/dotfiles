#!/usr/bin/env bash

function d() {
	#: various formatting optiosn for date and time
	#: usage: d [no_opt]; d [cal],[time],[epoch],[-1,2,3],[-h],[--help],[-v],[--version]

description='
#:    Title: d[ate]
#: Synopsis: date and time formatting shortcuts; d [opt], d [no_opt]
#:     Date: 2016-06-04
#:  Version: 0.0.2
#:  Options: -h: print short usage info
#:           -v: print version number
#:        cal,1: prints the date as YYYY-MM-DD
#:       time,2: prints the time as HH:MM:SS
#:      epoch,3: prints unix epoch time
#:       long,4: prints time and date as Saturday, 4 June 2016
#:          all: prints all four primary functions
'
	funcname="d"
	usage="d [cal],[time][epoch],[long],[all],[-h],[-v]"
	date_of_creation=2016-05-30
	updated=2016-06-04
	version=0.0.2

	function usage() {
		printf "  %s\n"  "$description" | sed 's/^#: /    /g' # cut -c 4-
	}


	divider====================================
	divider=$divider${divider}${divider}

	calvar=$(date "+%Y-%m-%d")
	timevar=$(date "+%H:%M:%S")
	unixvar=$(date -j -f "%a %b %d %T %Z %Y" "`date`" "+%s")
	longdate=$(date "+%A, %-d %B %Y")

	case "$1" in
		cal|1)
			#: date in descending values: YYYY-MM-DD
			date "+  %Y-%m-%d"
			;;
		time|2)
			#: time in descending values: HH:MM:SS
			date "+  %H:%M:%S"
			;;
		epoch|3)
			#: unix epoch time: 1464673442
			date -j -f "%a %b %d %T %Z %Y" "`date`" "+%s"
			;;
		long|4)
			#: date and time: Saturday, 4 June 2016
			date "+  %A, %-d %B %Y"
			;;
		all)
			printf "\n  %s\n" "$calvar  |  $timevar"
			printf "  %s\n" "$unixvar  |  $longdate"
			echo
			;;
		-h | --help)
			usage
			;;
		-v | --version)
			echo
			printf "  %s\n" "$funcname : v$version"
			echo
			;;
		'')
			printf "  %s\n" "$calvar  |  $timevar"
			;;
		*)
			printf "\n  %s\n" "invalid option '$1'"
			usage
			return 1
			;;
	esac
}

$1 $2 $3
