#!/bin/bash

USER=$(id -u)
rootuser=$(sudo id -u)
if [$USER = 0 ] ; then
 echo "user is root user"
else 
 echo "Need to change to root user"