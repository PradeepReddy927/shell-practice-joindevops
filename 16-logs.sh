#!/bin/bash

USERID=$(id -u)
R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

LOGS_FOLDER="/var/log/shell-script"
SCRIPT_NAME=$( echo $0 | cut -d "." -f1 )
LOG_FILE="$LOGS_FOLDER/$SCRIPT_NAME.log"

mkdir -p $LOGS_FOLDER
echo "Script started executed at: $(date)"

if [ $USERID -ne 0 ]; then
    echo "ERROR:: Please run this script with root privileges"
    exit 1 #failure is other than 0
fi

VALDATE(){ #functions receive inputs through args just like shell script args
   if [ $1 -ne 0 ]; then
       echo -e "Installing $2 ... $R FAILURE $N"
       exit 1
    else
       echo -e "Installing $2 ... $G SUCCESS $N"
    fi
}       

dnf list installed mysql &>>$LOG_FILE
# Install if it is not found
if [ $? -ne 0 ]; then
    dnf install mysql -y &>>$LOG_FILE
    VALIADTE $? "MYSQL"
else
    echo -e "MYSQL already exist ... $Y SKIPPING $N"
fi

dnf list installed nginx &>>$LOG_FILE
if [ $? -ne 0]; then
    dnf install nginx -y &>>$LOG_FILE
    VALDATE $? "Ngnix"
else
    echo -e "Nginx already exist ... $Y SKIIPING $N"
fi

dnf list installed python3 &>>$LOG_FILE 
if [ $? -ne 0]; then
    dnf install python3 -y &>>$LOG_FILE
    VALDATE $? "python3"
else
    echo -e "Python3 already exist ... $Y SKIIPING $N"
fi
