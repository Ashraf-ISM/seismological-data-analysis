#!/bin/bash -xv
#In this script we have added some hint fo guessing the correct number.
echo "Enter the number between 1 to 10:"
read guess
echo "Your guess is $guess "
echo " "
if [ "$guess" -gt 10 -o "$guess" -lt 1 ]
then 

    echo "Your guess is out of the boundary.Please guess again."
    echo " guess the number between 1 to 10."
elif [ $guess -gt 6 ]
then 
   echo "Your guess is too much high.Please try smaller one."
elif [ $guess -lt 6 ]
then
   echo "Your guess is too much low."
else
   echo " Congratulations your guess $guess is correct "
fi 
