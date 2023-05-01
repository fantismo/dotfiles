#!/usr/bin/env bash

function hgr() {
description='
#:    Title: hgr
#: Synopsis: grep $1 from history results - Usage: hgr git
#:     Date: 2016-11-15
#:  Version: 0.0.7
'	history | grep "$1"
}