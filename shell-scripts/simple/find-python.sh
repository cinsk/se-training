#!/bin/bash

PYTHON=/usr/bin/python-huh

if [ -x "$PYTHON" ]; then
    echo "DONE"
else
    if which python &>/dev/null; then
        PYTHON=python
    elif which python2 &>/dev/null; then
        PYTHON=python2
    elif which python3 &>/dev/null; then
        PYTHON=python3
    else
        echo "cannot find any python implementation"
        exit 1
    fi
fi

echo "PYTHON=$PYTHON"

"$PYTHON" --version
