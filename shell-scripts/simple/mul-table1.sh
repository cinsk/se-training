#!/bin/bash

for x in $(seq 2 9); do
    for y in $(seq 2 9); do
        value=$((x * y))
        echo "$x x $y = $value" # You could do: echo "$x x $y = $((x * y))" 
    done
done
