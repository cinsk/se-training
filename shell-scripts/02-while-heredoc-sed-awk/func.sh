#!/bin/bash

PROGRAM_NAME="$(basename "$0")"
#
# error 0 "detect a problem, continuing..."
# error 1 "cannot recover, aborting..."
# 
error() {
    local EXIT_STATUS="$1"

    shift
    echo "$PROGRAM_NAME: $*" 1>&2

    [ "$EXIT_STATUS" -ne 0 ] && exit "$EXIT_STATUS"
}

ls-l() {
    ls -l "$@"
}

# ls-l --help --version
#      ^^^^^^ ^^^^^^^^^
#      $1     $2
# $@ = "--help" "--version"
# $* = "--help --version"
# $# = 2

[ "$#" -eq 0 ] && error 1 "argument(s) required"

while [ -n "$1" ]; do
    BASE="$1"
    COUNT=1
    while [ "$COUNT" -lt 10 ]; do
        echo "$BASE x $COUNT = $((BASE * COUNT))"
        COUNT=$((COUNT + 1))
    done
    shift
done

# for x in "$@"; do
#     for y in $(seq 1 9); do
#         echo "$x x $y = $((x * y))"
#     done
# done

