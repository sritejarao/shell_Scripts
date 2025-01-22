#!/bin/bash

USER=$(id -u)
rootuser=$(sudo id -u)
if [$USER -ne 0 ] ; then
 echo "user is root user"
else 
 echo "current Need t887787bkbjh8o change to root user"
figit 