#!/bin/bash

audible download --aaxc --chapter --cover -t "$1"

if [ "$2" == "-ns" ]; then
	echo not splitting
	aaxtomp3 -e:mp3 ./*.aaxc
else
	aaxtomp3 -e:mp3 --chaptered ./*.aaxc
fi

rm ./*.aaxc
rm ./*.json
rm ./*.voucher
rm ./*.jpg
