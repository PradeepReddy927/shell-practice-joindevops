#!/bin/bash

USERID=$(id -u)
R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

LOGS_FOLDER= "var/log/shell-script"
SCRIPT_NAME=$( echo $0 | cut -d "." -f1 )
LOG_FILE="$LOGS_FOLDER/$SCRIPT_NAME.log"

mkdir -p $LOGS_FOLDER
echo "Script started exectued at: $(date)"

if [ $USERID -ne 0 ]
then
echo "ERROR: Please run this scripts with root privileges"
exit 1 # failure is other than 0
fi 

VALIDATE(){ # functions receive inputs through args just like shell script args
 if [ $1 -ne 0 ]
 then
 echo -e "Installing $2 ... $R is failure $N"
 exit 1
 else
 echo -e "Installing $2 ... $G is Success $N"
 fi
}

dnf list installed mysql &>>$LOG_FILE
#Install if it is not found
if [ $? -ne 0]
then
dnf install mysql -y  &>>$LOG_FILE
VALIDATE $? "MYSQL"
else
echo -e "MYSQL already Exist ... $Y SKIPPING $N"
fi


dnf list instaleed nginx &>>$LOG_FILE
if [ $? -ne 0 ]
then
dnf install nginx -y &>>$LOG_FILE
VALIDATE $? "nginx"
else
echo -e "nginx already Exist ... $Y SKIPPING $N"
fi

dnf list installed python3 &>>$LOG_FILE
if [ $? -ne 0 ]
then
dnf install python3 -y &>>$LOG_FILE
VALIDATE $? "python3"
else
echo -e "python3 already Exist ... $Y SKIPPING $N"
fi

