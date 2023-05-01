#!/usr/bin/env bash

function mkcd() {
	#: Create a new directory and enter it
	mkdir -p "$@" && cd "$_";
}
