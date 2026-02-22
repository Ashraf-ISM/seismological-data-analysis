#!/bin/bash -xv

# This script is written for the guessing a number.

echo "Guess the number between 1 to 10."
read guess
if [ $guess -eq 6 ]
then
    echo "Congratulations you guessed correctly."
else
    echo "Your $guess is wrong"
fi


