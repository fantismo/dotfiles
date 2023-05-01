#!/usr/bin/env bash

function myip() {
	# prints the machine lan ip and the network wan ip. optionally copies to clipboard on osx.

	function printlan() {
		printf "%s\n" "$localIP"
	}

	function printwan() {
		printf "%s\n" "$wanIP"
	}

	function printboth() {
		printf "\n  %s\t%s\n" 'lan' "$localIP"
		printf "  %s\t%s\n\n" 'wan' "$wanIP"
	}

	function copyip() {
		tr '\n' ' ' | /usr/bin/pbcopy
	}

	function usage() {
		echo
		printf "  %s\n" "${UNDERLINE}myip:${NORMAL} displays lan, wan ip either separately or together. optionally copies either to clipboard." ""
		printf "    %s\n    %s\n\n" "${MAGENTA}myip${NORMAL}"  "  prints local lan ip and network wan ips on separate lines"
		printf "    %s\n    %s\n\n" "${MAGENTA}--help${NORMAL}" "  displays this usage info"
		printf "    %s\n    %s\n\n" "${MAGENTA}-l [--lan]${NORMAL}" "  prints only local lan ip"
		printf "    %s\n    %s\n\n" "${MAGENTA}-w [--wan]${NORMAL}" "  prints only network wan ip"
		printf "    %s\n    %s\n\n" "${MAGENTA}--cpl${NORMAL}" "  copies the local lan ip to clipboard with on-screen confirmation"
		printf "    %s\n    %s\n\n" "${MAGENTA}--cpw${NORMAL}" "  copies the network wan ip to clipboard with on-screen confirmation"
	}

	local theOS=$(uname)
	local wanIP=$(curl -s https://api.ipify.org)
	local YELLOW=$(tput setaf 3)
	local BLUE=$(tput setaf 4)
	local MAGENTA=$(tput setaf 5)
	local NORMAL=$(tput sgr0)
	local UNDERLINE=$(tput smul)



	if [ $theOS == 'Darwin' ]; then
		local localIP=$(ifconfig | grep -o '192.168.1.[0-9]\+' | grep -v '192.168.1.255')
	elif
		[ $theOS == 'Linux' ]; then
		local localIP=$(ip addr | grep -o '192.168.1.[0-9]\+' | grep -v '192.168.1.255')
	fi

	case "$1" in
		-l|--lan)
			printlan
			;;
		-w|--wan)
			printwan
			;;
		--cpl)
			printlan | copyip
			local var=$(pbpaste)
			printf "\n  %s\n\n" "copied lan ip: $var"
			;;
		--cpw)
			printwan | copyip
			local var=$(pbpaste)
			printf "\n  %s\n\n" "copied wan ip: $var"
			;;
		-h|--help)
			usage
			;;
		*)
			printf "\n  %s\n" "myip -h [--help], -l [--lan], -w [--wan], --cpl, --cpw"
			printboth
			;;
	esac
}
