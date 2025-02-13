#!/bin/bash

USER=$(id -u)

LOG_FILE=$(echo $0 | cut -d "." -f1 )
day=$(date +%y-%m-%d)
TIME_STAMP=$(date +%y-%m-%d-%H-%M-%S)
PATH1="/var/log/script_logs"

echo "$LOG_FILE"
#LOG_FILE="Adding_logs"

echo "$day"
LOGFILENAME="$PATH1/$LOG_FILE-$day.log"
echo "$LOGFILENAME"


VALIDATE()
{
    if [ $? -ne 0 ]; then
        echo "$2 is not installed, check once please" &>> $LOGFILENAME
        exit 1
    else
        echo " $2 installation is complete" &>> $LOGFILENAME
    fi
}

if [ $USER -ne 0 ]; then
    echo "To install mysql user should have root access"
    exit 1
else 
    echo "This user can only install mysql service" &>> $LOGFILENAME
fi

dnf list installed mysql

if [ $? -ne 0 ]
then
    echo  "MySql is not installed, starting the installation process at : $TIME_STAMP" &>> $LOGFILENAME
    dnf install mysql -y  &>> $LOGFILENAME

    VALIDATE $? "MySQl"

else
    echo "mysql is already installed on this server" &>> $LOGFILENAME
    
fi

dnf list installed git
VALIDATE $? "Git" &>> $LOGFILENAME

dnf list installed ngnix
VALIDATE $? "ngnix"

exit 0
