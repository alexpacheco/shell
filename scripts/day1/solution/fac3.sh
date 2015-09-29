#!/bin/bash

usage () {
    echo "USAGE: $0 <integer>"
    exit
}

factorial() {
    local i=$1
    local f
    local type=$2
    
    declare -i i
    declare -i f
    
    if [[ "$i" -le 2 && "$i" -ne 0 ]]; then
	echo $i
    elif [[ "$i" -eq 0 ]]; then
	echo 1
    else
	case $type in
	    "single")
		f=$(( $i - 1 ))
		;;
	    "double")
		f=$(( $i - 2 ))
		;;
	esac
	f=$( factorial $f $type)
	f=$(( $f * $i ))
	echo $f
    fi
}

if [[ "$#" -eq 0 ]]; then
    usage
else
    for i in $@ ; do
	x=$( factorial $i single )
	y=$( factorial $i double )
	echo "$i! = $x & $i!! = $y"
    done
fi

