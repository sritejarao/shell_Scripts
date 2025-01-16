#!/bin/bash

day=date | cut -d ' ' -f1

if [day=="Sun"];then
echo "Today is holiday"
else
echo "Not sunday going to school"