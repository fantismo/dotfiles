#!/usr/bin/env bash

function rotl() {
    theFile=$1
    theOutput="$1_rotated"

    ffmpeg -i "$theFile" -vf "transpose=1" "$theOutput"
}
