#!/bin/bash

backup () {
	local d="$1"
	[[ -z $d ]] && { echo "${FUNCNAME}(): directory name not specified"; exit 1; }
	echo "Starting backup ..."
	tar -czf $2 $d
	echo "backup written to $2"
}

backup $1 $2
