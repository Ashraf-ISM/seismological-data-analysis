#!/bin/bash

favorite=123   # You can change this number
num_guesses=0

echo "Guess my favorite number (between 0 and 200)"
echo "Type q to quit."

while true
do
    read guess

    # Quit option
    if [ "$guess" = "q" ]; then
        echo "You quit the game."
        break
    fi

    # Increase guess counter
    num_guesses=$((num_guesses + 1))

    # Check correct guess
    if [ "$guess" -eq "$favorite" ]; then
        echo "Correct! 🎉 You guessed my favorite number!"
        echo "Total guesses: $num_guesses"
        break
    fi

    # Higher or Lower hint
    if [ "$guess" -lt "$favorite" ]; then
        echo "Guess higher!"
    else
        echo "Guess lower!"
    fi

    # Close hint (within 20)
    diff=$(( guess - favorite ))
    if [ ${diff#-} -le 20 ]; then
        echo "You are close! (within 20)"
    fi

    # Show total guesses
    echo "Total guesses so far: $num_guesses"

    # Every 5th guess ask to quit
    let remainder=$num_guesses%5
    if [ "$remainder" -eq 0 ]; then
        echo "Do you want to quit? (y/n)"
        read answer
        if [ "$answer" = "y" ]; then
            echo "Game ended. My number was $favorite"
            break
        fi
    fi

done
