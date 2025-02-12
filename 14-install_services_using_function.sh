#!/bin/bash

USER=$(id -u)

VALIDATE()
{
    if [ $? -ne 0 ]; then
        echo -e "\e[31m $2 is not installed, check once"
        exit 1
    else
        echo -e "\e[32m $2 installation is complete"
    fi
}

if [ $USER -ne 0 ]; then
    echo "To install mysql user should have root access"
    exit 1
else 
    echo "This user can only install mysql service"
fi

dnf list installed mysql

if [ $? -ne 0 ]
then
    echo -e "\e[33m MySql is not installed, starting the installation process"
    dnf install mysql -y

    VALIDATE $? "MySQl"

else
    echo -e "\e[32m mysql is already installed on this server"
    
fi

dnf list installed git
VALIDATE $? "Git"

dnf list installed ngnix
VALIDATE $? "ngnix"

exit 0
