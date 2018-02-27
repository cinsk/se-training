#!/bin/bash

PROGRAM_NAME="$(basename "$0")"

if [ "$#" -ne 1 ]; then
    echo "Usage: $PROGRAM_NAME [DIGIT]"
    exit 1
fi

base="$1"

for x in $(seq 2 9); do
    value=$((base * x))
    echo "$base x $x = $value"
done
