#!/bin/bash

USERID=$(id -u)
R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

if [ $USERID -ne 0 ]
then
echo "ERROR: Please run this script with root privileges"
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

dnf list installed mysql &>>$LOGS_FILE
#Install if it is not found
if [ $? -ne 0]
then
dnf install mysql -y &>>$LOGS_FILE
VALIDATE $? "MYSQL"
else
echo -e "MYSQL already Exist ... $Y SKIPPING $N"
fi


dnf list instaleed nginx &>>$LOGS_FILE
if [ $? -ne 0 ]
then
dnf install nginx -y &>>$LOGS_FILE
VALIDATE $? "nginx"
else
echo -e "nginx already Exist ... $Y SKIPPING $N"
fi

dnf list installed python3 &>>$LOGS_FILE
if [ $? -ne 0 ]
then
dnf install python3 -y &>>$LOGS_FILE
VALIDATE $? "python3"
else
echo -e "python3 already Exist ... $Y SKIPPING $N"
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

dnf list installed mysql
#Install if it is not found
if [ $? -ne 0]
then
dnf install mysql -y
VALIDATE $? "MYSQL"
else
echo -e "MYSQL already Exist ... $Y SKIPPING $N"
fi


dnf list instaleed nginx
if [ $? -ne 0 ]
then
dnf install nginx -y
VALIDATE $? "nginx"
else
echo -e "nginx already Exist ... $Y SKIPPING $N"
fi

dnf list installed python3
if [ $? -ne 0 ]
then
dnf install python3 -y
VALIDATE $? "python3"
else
echo -e "python3 already Exist ... $Y SKIPPING $N"
fi
