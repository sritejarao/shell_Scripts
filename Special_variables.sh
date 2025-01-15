#!/bin/bash
echo "All variables passed : $@"
echo "number of variables : $#"
echo "Scriptname : $0"
echo "Current working directory: $PWD"
echo "Current Home directory: $HOME"
echo "Which user running the script: $USER"
echo "processid for current script: $$"
echo "processeid for last command: $!"