#!/bin/bash

USERID=$(id -u)

if [ $USERID -ne 0 ]
then
echo "ERROR: Please run this script with root privileges"
exit 1 # failure is other than 0
fi

VALIDATE(){ # functions receive inputs through args just like shell script args
 if [ $1 -ne 0 ]
 then
 echo "ERROR: Installing $2 is failure"
 exit 1
 else
 echo "Installing $2 is Success"
 fi

}

dnf install mysql -y
VALIDATE $? "MYSQL"

dnf install nginx -y
VALIDATE $? "nginx"

dnf install mongodb-mongosh -y
VALIDATE $? "mongosh"

