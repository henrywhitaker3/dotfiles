#!/bin/bash

args=("$@")

pipeTo=""
prev=""
for arg in "$@"; do
    if [[ "$arg" == "|" ]]; then
        pipeTo=""
        break
    else
        if [[ "$prev" == "-o" && "$arg" == "yaml" ]]; then
            pipeTo="yq"
            break
        elif [[ "$prev" == "-o" && "$arg" == "json" ]]; then
            pipeTo="jq"
            break
        fi
    fi
    prev="$arg"
done

if [[ "$pipeTo" == "" ]]; then
    kubectl "${args[@]}"
else
    kubectl "${args[@]}" | "$pipeTo"
fi
