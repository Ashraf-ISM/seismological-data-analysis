#!/bin/bash -xv
# In this script we will use the while loops for the guessing of the animal.Which I have already done oreviously.
echo "Guess the Animal"
read guess
echo "Your guess is $guess"
guess_flag="Lion"

while [ "$guess_flag" = "Lion" ]
do
 if [ "$guess"
