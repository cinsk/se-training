#!/bin/bash

# Set PYTHON to the location of python(1).
PYTHON=/usr/bin/python

if [ -x "$PYTHON" ]; then
    echo "DONE"
else
    echo "python not found: $PYTHON"
    exit 1
fi

echo "PYTHON=$PYTHON"

"$PYTHON" --version
