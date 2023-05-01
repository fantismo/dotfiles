#!/usr/bin/env bash

function szup() {

description='
#:    Title: szup
#: Synopsis: sort all items within a directory according to size
#:     Date: 2016-05-30
#:  Version: 0.0.5
#:  Options: -h | --help: print short usage info
#:         : -v | --version: print version number
'

funcname=$(echo "$description" | grep '^#:    Title: ' | sed 's/#:    Title: //g')
version=$(echo "$description" | grep '^#:  Version: ' | sed 's/#:  Version: //g')
updated="$(echo "$description" | grep '^#:     Date: ' | sed 's/#:     Date: //g')"

	function usage() {
		printf "\n%s\n" "$funcname : $version : $updated"
		printf "%s\n" ""
	}

	function sortdir() {
		Chars="$(printf "    %s" "inspecting " "$(pwd)" | wc -c)"
		divider=====================
		divider=$divider$divider$divider$divider
		format="    %-${Chars}.${Chars}s %35s\n"
		totalwidth="$(ls -1 | /usr/local/bin/gwc -L)"
		totalwidth=$(echo $totalwidth | grep -o [0-9]\\+)
		Chars=$(echo $Chars | grep -o [0-9]\\+)
		if [ "$totalwidth" -lt "$Chars" ]; then
			longestvar="$Chars"
		else
			longestvar="$totalwidth"
		fi
		shortervar=$(/Users/danyoung/bin/qc "$longestvar"*.8)
		shortervar=$(printf "%1.0f\n" "$shortervar")
		echo "$shortervar"
		printf "\n    %s\n" "inspecting $(pwd)"
		printf "    %$shortervar.${longestvar}s\n" "$divider"
		theOutput="$(du -hs "${theDir}"/* | gsort -hr)"
		Condensed="$(echo -n "$theOutput" | awk '{ print $1","$2 }')"
		unset arr
		declare -a arr
		arr=($(echo "$Condensed"))
		Count="$(echo "$(printf "%s\n" "${arr[@]}")" | wc -l)"
		Count=$((Count-1))
		for i in $(seq 1 $Count); do
		read var1 var2 <<< "$(printf "%s\n" "${arr[$i]}" | sed 's/,/ /g')"
		printf "   %5s    %-16s\n" "$var1" "${var2//\/*\//./}"
		done
		echo
	}

	case "$1" in
		-h|--help)
			usage
			return 0
			;;
		*)
			:
			;;
	esac

     if [ -z "$1" ]; then
             oldDir="$(pwd)"
             cd "${1}"
             local theDir="$(pwd)"
             sortdir
             cd "$oldDir"
             return 0
     else
     		:
             oldDir="$(pwd)"
             cd "${1}"
             local theDir="$(pwd)"
             sortdir
             cd "$oldDir"
             return 0
     fi
}
