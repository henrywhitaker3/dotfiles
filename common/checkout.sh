#!/bin/bash

if [[ $# -ne 1 ]]; then
	echo "Must supply branch name"
	exit 1
fi

git checkout -b "$1"
