#!/bin/bash

ifconfig -a | awk -f <(cat <<'EOF'
/^[a-zA-Z0-9]+:?/ { 
        gsub(/:$/, "", $1); 
        intr=$1
        next
}

/^[ \t]*inet / { 
        print intr, $2
}
EOF
                      )
