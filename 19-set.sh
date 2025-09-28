#!/bin/bash

set -e

error(){
    echo "There is a error" 
}

trap error ERR

echo "Hello .."
echo "Before error"
uhdijjfijf;dnf # here shell understands there is an error and signal is ERR
echo "After error"
