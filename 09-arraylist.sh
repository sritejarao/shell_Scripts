#!/bin/bash

MOVIES=("tej" "sri" "dev")

echo "${MOVIES[0]}"

#To print all values of the array

echo "${MOVIES}"

echo "${MOVIES[$@]}"