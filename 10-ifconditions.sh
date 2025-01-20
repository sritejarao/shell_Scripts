#!/bin/bash

day=date | cut -d ' ' -f1

if [ day = "Mon" ] then
 echo "Today is holiday"
else
 echo "today is not sunday, going to school"
fi