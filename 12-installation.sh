#!/bin/bash

USERID=$(id -u)

if [ $USERID -ne 0 ]
then
echo "ERROR: Please run this script with root privileges"
exit 1 = failure is other than 0
fi

dnf install mysql -y

if [ $? -ne 0 ]
then
echo "ERROR: Insatlling MYSQL is failure"
exit 1
else
echo "Installing MYSQL is Success"
fi