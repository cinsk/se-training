#!/bin/bash

# Run this script in following ways, and figure out how the arguments
# passed to it.
#
# $ ./args.sh
# $ ./args.sh hello world
# $ ./args.sh hello world "a b c"
# $ ./args.sh *

echo "\$# - $#"
index=1
for arg in "$@"; do
    echo "\$${index} - |$arg|"
    index=$((index + 1))
done
