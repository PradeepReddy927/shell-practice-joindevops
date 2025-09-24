#!/bin/bash

 echo "All variables passed to the script: $@"
 echo "All variables passed to the script: $*"

 echo "Script name:$0"
 echo "Current directory: $PWD"
 echo "Who is running this: $USER"
 echo "Home directory for user: $HOME" 
 echo "PID of this scripts: $$"
 sleep 50 &
 echo "PID of the last command in background is: $!"