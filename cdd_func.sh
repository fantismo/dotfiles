#!/usr/bin/env bash

function cdd() {
description='
#:    Title: cdd
#: Synopsis: switch back to last dir; also suppress path of previous dir
#:     Date: 2016-11-15
#:  Version: 0.0.4
'
	#: modification to 'cd -' to indent the output of the destination dir
	cd - &> /dev/null
}
