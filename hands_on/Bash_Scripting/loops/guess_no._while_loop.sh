#!/bin/bash

#In this script we will see the uses of the while loop for the guessing the correct number.
echo " Enter the number between 1 to 10 "
read guess
echo "Your guess is $guess".
guess_flag="incorrect"
while [ "$guess_flag" = "incorrect" ]
do 
 if [ $guess -gt 6 ]
 then 
    echo " Your guess is too much high"
    echo "Follow the instructions and guess lower values."
 
    echo "Enter the new guess"
    read guess

 elif [ $guess -lt 6 ]
 then
     echo "Your guess is too low.\nTry some larger number"
     echo "Enter the new guess: "
     read guess 
 else 
    echo "You got it"
    guess_flag="correct"
 fi
done  
   

