#!/bin/bash

USER=$(id -u)

PATH="/var/log/script_logs"
#LOG_FILE=$(echo $0 | cut -d "." -f1)
LOG_FILE="Adding_logs"
day=$(date +%Y-%m-%d)
LOGFILENAME="$PATH/$LOG_FILE-$day.log"
TIME_STAMP=$(date +%Y-%m-%d-%H-%M-%S)

VALIDATE()
{
    if [ $? -ne 0 ]; then
        echo "$2 is not installed, check once"
        exit 1
    else
        echo " $2 installation is complete"
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
    echo  "MySql is not installed, starting the installation process at : $TIME_STAMP" &>> $LOGFILENAME
    dnf install mysql -y  &>> $LOGFILENAME

    VALIDATE $? "MySQl"

else
    echo "mysql is already installed on this server"
    
fi

dnf list installed git
VALIDATE $? "Git"

dnf list installed ngnix
VALIDATE $? "ngnix"

exit 0
