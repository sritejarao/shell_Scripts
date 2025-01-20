#!/bin/bash

USER=$(id -u)
R="\e[31m"
G=\e[32m"

VALIDATE()
{
    if [ $? -ne 0 ]; then
        echo -e "$R $2 is not installed, check once"
        exit 1
    else
        echo  -e "$G $2 installation is complete"
    fi
}

if [ $USER -ne 0 ]; then
    echo "To install mysql user should have root access"
    exit 1
else 
    echo -e "$G This user can only install mysql service"
fi

dnf list installed mysql

if [ $? -ne 0 ]
then
    echo  "MySql is not installed, starting the installation process"
    dnf install mysql -y

    VALIDATE $? "MySQl"

else
    echo "mysql is already installed on this server"
    
fi

dnf list installed git
VALIDATE $? "Git"

dnf list installed ngnix
VALIDATE $? "ngnix"

