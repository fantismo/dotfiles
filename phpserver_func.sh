#!/usr/bin/env bash

function phpserver() {
	# Start a PHP server from a directory, optionally specifying the port
	# (Requires PHP 5.4.0+.)
	local port="${1:-4000}";
	local ip=$(ipconfig getifaddr en0);
	sleep 1 && php -S "${ip}:${port}";
}
