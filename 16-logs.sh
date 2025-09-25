#!/bin/bash

USERID=$(id -u)
R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"


LOGS_FOLDER= "var/log/shell-script"
SCRIPTS_NAME=$( echo $0 | cut -d "." -f1 )
LOGS_FILE="$LOGS_FOLDER/$SCRIPTS_NAME.log"


mkdir -p $LOGS_FOLDER
echo "Scripts started exectued at: $(date)"

if [ $USERID -ne 0]
then
echo "ERROR: Please run this scripts with root privileges"
EXit 1 #Failure is other then 0
fi 



