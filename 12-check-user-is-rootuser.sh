#!/bin/bash

USER=$(id -u)
rootuser=$(sudo id -u)
if [$USER -ne 0 ] ; then
 echo "user is root user"
else 
 echo "current Need to change to root user"
fi