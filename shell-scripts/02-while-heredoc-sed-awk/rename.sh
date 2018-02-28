#!/bin/bash

find . -name '*.JPG' | while read filename; do
    # filename == ./camera1/AA/IMG_0012.JPG

    DIR=$(dirname "$filename")                    # DIR=./camera1/AA
    BASE=$(basename "$filename")                  # BASE=IMG_0012.JPG
    NEW_BASE=$(echo "$BASE" | tr "[A-Z]" "[a-z]") # NEW_BASE=img_0012.jpg

    echo mv "$filename" "${DIR}/${NEW_BASE}"

done
