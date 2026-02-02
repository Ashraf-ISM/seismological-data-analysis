#!/bin/bash

# Print the user information who currently login.

echo " User who is currently logged in is $USER"

# Print the current date and time

echo "The current date and time is: ";date
# Or also we can print date and time by
echo "Current date and time is $(date)"
# Print the total no of user logged in

echo "Number of user logged in ", who | wc -l

# Printing the calendar

echo "Calendar"
cal
