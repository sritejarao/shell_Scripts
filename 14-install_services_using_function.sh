#!/bin/bash

USER=$(id -u)

VALIDATE()
{
    if [ $? -ne 0 ]; then
        echo "$2 is not installed properly, check once"
        exit 1
    else
        echo "$2 installation is complete"
    fi
}

if [ $USER -ne 0 ]; then
    echo "To install mysql user shoould have root access"
    exit 1
else 
    echo "This user can only install mysql service"
fi

dnf list installed mysql

if [ $? -ne 0 ]
then
    echo "MySql is not installed, starting the installation process"
    dnf install mysql -y

    VALIDATE $? "MySQl"

else
    echo "mysql is already installed on this server"
    
fi

dnf list installed git
VALIDATE $? "Git"
