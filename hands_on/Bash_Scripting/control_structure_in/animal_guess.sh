#!/bin/bash -xv

# This script will take input name of the animal and guess them to by default if they are lion or not.
echo "Enter the animal name"
read guess
if [ $guess="Lion" ]
then 
    echo " Your guess is correct"
else
    echo "$guess is incorrect"
fi 
