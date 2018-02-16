#!/bin/bash

PROGRAM_NAME=$(basename "$0")
DEBUG=0

error() {
    local ecode="$1"
    shift
    echo "$PROGRAM_NAME: $*" 1>&2
    [ "$ecode" -ne 0 ] && exit "$ecode"
}

debug() {
    if [ "$DEBUG" -ne 0 ]; then
        echo "debug: $*" 1>&2
    fi
}


if !which gawk >/dev/null 2>&1; then
    error 1 "gawk not found"
fi


ls | gawk -f <(cat <<'EOF'
BEGIN {
  print "--START OF AWK SCRIPT--"
}

{
  print $0
}

END {
  print "--END OF AWK SCRIPT--"
}
EOF
          ) "$@"

