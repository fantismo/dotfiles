#!/usr/bin/env bash

function shc() {
    #: shellcat v2: cat for shell scripts, source code.
    #: prints text with line numbers and syntax highlighting.
    #: accepts input as argument or pipe.

    if [ $# -eq 0 ]; then
        # arguments equal zero; assume piped input
        nl | /usr/local/bin/pygmentize -l bash
        # accept piped input, process as source code
    else
        case "$1" in
            -h|--help)
                printf "%s\n" "shc usage:" "           shc [file]" "           type [function] | shc"
                ;;
            -v|--version)
                printf "%s\n" "vers 2"
                ;;
            *)
                if [ -f "$1" ]; then
                    # test anything that isn't expected flags for file
                    cat "$1" | nl | /usr/local/bin/pygmentize -l bash
                    # process file as source code
                else
                    # if not a file or expected flags, bail
                    printf "%s\n" "error; not the expected input. read shc_func source for more details"
                fi
        esac
    fi
# v1 for posterity:
#
# function shc() {
#     #: print file with line numbers and syntax highlighting
#     cat -n "$1" | /usr/local/bin/pygmentize -l bash
# }
}
