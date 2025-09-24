#!/bin/bash

USERID=$(id -u)

if [ $USERID -ne 0 ]
then
echo "ERROR: Please run this script with root privileges"
fi

dnf install mysql -y

if [ $? -ne 0 ]
then
echo "ERROR: Insatlling MYSQL is failure"
else
echo "Installing MYSQL is Success"
fi