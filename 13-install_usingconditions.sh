#!/bin/bash

USER=$(id -u)

if [ $USER -ne 0 ]
then
    echo "To install mysql user shoould have root access"
    exit 1
else 
    echo "This user can install mysql service"
fi

dnf list installed mysql

if [ $? -ne 0 ]
then
    echo "MySql is not installed"
else
    echo "mysql is installed on this server"
fi

#dnf install mysql -y

