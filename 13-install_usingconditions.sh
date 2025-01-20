#!/bin/bash

USER=$(id -u)

if [ $USER -ne 0 ]; then
    echo "To install mysql user shoould have root access"
    exit 1
else 
    echo "This user can install mysql service"
fi

dnf list installed mysql

if [ $? -ne 0 ]
then
    echo "MySql is not installed, starting the installation process"
    dnf install mysql -y
    
    if [ $? -ne 0]; then
        echo "mysql is not installed properly, check once"
        exit 1
    else
        echo "mySql installation is complete"
    fi

else
    echo "mysql is installed on this server"
    exit 1
fi

