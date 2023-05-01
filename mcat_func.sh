#!/usr/bin/env bash

function mcat() {

description='
#:    Title: mcat
#: Synopsis: accepts multiple files from stdin and displays them consecutively
#:     Date: 2016-05-30
#:  Version: 0.0.5
#:  Options: -h | --help: print short usage info
#:         : -v | --version: print version number
#:         : --tutorial: prints longer help info
'

    function usage() {
        echo
        printf "  %s\n\n" "${UNDERLINE}mcat:${NORMAL} batch file display with added whitespace."
        printf "  %s\n%s\n" "usage: mcat [-h],[--help],[--tutorial] aFile.txt bFile.txt cFile.txt"
    }

    function displaytutorial() {
        echo "$tutorial" | sed 's/^/  /g' # | /usr/bin/less
    }

    function displayfiles() {
        echo
        for i in $shortArgs; do
            printf "     %s\n"  "$i"
            printf "     %s\n\n"  "$rule"
            cat "$i" | sed 's/^/     /g'
            echo; echo; echo
        done
        printf "     %s\n" "$lastArg"
        printf "     %s\n\n" "$rule"
        cat "$lastArg" | sed 's/^/     /g'
        echo; echo
    }

local tutorial='
mcat: displays multiple files with added whitespace to improve readability.
usage: mcat [-h],[--help],[--tutorial] aFile.txt bFile.txt cFile.txt

$ mcat /tmp/aFile.txt /tmp/bFile.txt /tmp/bbb.txt

  /tmp/aFile.txt
  ---------------------------------------------------------------------------
     one two
     three four


  /tmp/bFile.txt
  ---------------------------------------------------------------------------
     five six
     blah


  /tmp/bbb.txt
  ---------------------------------------------------------------------------
     blah what hello
     blah stuff here
     blah
     blah


'


    local theArgs="$@"
    local lastArg="${!#}"
    local length=$(($#-1))
    local shortArgs=${@:1:$length}
    local rule='========================='
    local rule=$rule$rule$rule

    case "$1" in
        -h|--help)
            usage
            return 0
            ;;
        --tutorial)
            clear
            echo
            displaytutorial
            return 0
            ;;
        *)
            displayfiles
            ;;
    esac


}

export _ext='printf "  %s\n" "${UNDERLINE}mcat:${NORMAL} batch file display with added whitespace."
printf "      %s\n%s" "usage: mcat [-h],[--help],[--tutorial] aFile.txt bFile.txt cFile.txt"'
