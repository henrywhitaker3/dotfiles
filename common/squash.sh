#!/bin/bash

if [[ $# -ne 1 ]]; then
	echo squash [number of commits]
	exit 1
fi

git reset --soft HEAD~"$1"
