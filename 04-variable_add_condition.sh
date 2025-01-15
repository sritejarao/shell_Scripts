#!/bin/bash

#Skip the script if values are empty.

x=$1
y=$2

# -z "$value" checks if the value is empty.
# -n "$value" checks if the value is non-empty.

if [ -n "$x" ] && [ -n "$y" ]; then
echo "$y -> Hello $x"
echo "$x -> Hi $y"
echo "${y} -> how are you doing $x"
echo "$x - doing great and u?"
echo "$y -> Mee too"

else
echo "values are empty"
fi