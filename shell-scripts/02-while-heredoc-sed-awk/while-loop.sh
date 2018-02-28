#!/bin/bash

PROGRAM_NAME="$(basename "$0")"

LIMIT="$1"
INDEX=0

if [ "$#" -ne 1 ]; then
    echo "error: argument(s) required" 1>&2
    echo "Usage: $PROGRAM_NAME LIMIT" 1>&2
    exit 1
fi

while [ "$INDEX" -lt "$LIMIT" ]; do
    echo "$INDEX"
    INDEX=$((INDEX + 1))
done


