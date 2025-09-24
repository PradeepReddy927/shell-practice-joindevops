#!/bin/bash

#everything in shell is considerd as string"
NUMBER1=100
NUMBER2=200
NAME=DevOps

SUM=$(($NUMBER1+$NUMBER2+$NAME))

echo "SUM is ${SUM}"

# SIZE = 4, MAX index = 3
LEADERS=("Modi" "Putin" "Trump" "Babu")


echo "ALL Leaders: ${LEADERS[@]}"
echo "First Leaders: ${LEADERS[0]}"
echo "First Leaders: ${LEADERS[10]}"