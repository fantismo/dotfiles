#!/usr/bin/env bash

function shebang() {
description='
#:    Title: shebang
#: Synopsis: generate plaintext file with shebang line, opening in edit mode via vi[m]
#:     Date: 2016-05-30
#:  Version: 0.1.0
#:  Options: shebang [options] ./path/to/file
#:         : [-h],[--help]: print usage info
#:         : [-v][--version]: print version number and last update
#:         : [--details]: print standardize script metadata
'

	local funcname=$(echo "$description" | grep '^#:    Title: ' | sed 's/#:    Title: //g')
	local version=$(echo "$description" | grep '^#:  Version: ' | sed 's/#:  Version: //g')
	local updated="$(echo "$description" | grep '^#:     Date: ' | sed 's/#:     Date: //g')"

    function scriptinfo() {
      echo
      echo "$(type $funcname | head -n 1)" # | head -c 1)"
      echo "$description" | sed 's/^#: //g' # cut -c 4-
    }

    case "$1" in
    	--details|-h|--help)
			scriptinfo
			return 0
			;;
		-v|--version)
			printf "\n%s\n\n" "$funcname : $version : $updated"
			return 0
			;;
		*)
			:
			;;
	esac

	{
		echo '#!/usr/bin/env bash'
		echo
		echo
	} > "$1"

    vi -c 'startinsert' +3 "$1"
}

