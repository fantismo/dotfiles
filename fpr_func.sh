#!/usr/bin/env bash

function fpr() {
    #: searches function libraries and prints function with syntax highlighting
    #: usage: fpr [funcname]

	local cnt=0
	local funcdir="/Users/danyoung/.dotfiles/functions/"

	[ -e "${funcdir}".DS_Store ] && rm /Users/danyoung/.dotfiles/functions/.DS_Store;

    for i in "${funcdir}"*;
    do
    	local f="$(sed -n "/^function ${1}() {/,/^}/p" "$i")"
    	if [ "$f" ]; then
            printf "\n    %s\n" "$i"
            local width="$(echo $i | gwc -m)"
            printf "    %$width.${width}s\n" $(rule =)
    		printf "\n%s\n\n"  "$f" | sed 's/^/    /g' | pygmentize -l bash
    		cnt=$(( cnt + 1 ))
    	fi
    done;

    if [ "$cnt" -eq 0 ]; then
    	printf "\n  %s\n\n" "match for $1 not found"
    	return 1
    else
    	return 0
    fi
}
