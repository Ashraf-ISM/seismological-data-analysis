#!/bin/bash
#📖 Theory

#In Bash, stdin (file descriptor 0) represents input to a program.

#By default, stdin is connected to the keyboard.

#Using <, we can redirect input from a file instead of typing manually.

# Script 

#!/bin/bash
# ==========================================
# Script Name: 01_stdin_redirection.sh
# Author: Ashraf
# Description: Demonstrates stdin redirection
# ==========================================

echo "Reading input from file using stdin redirection..."

# Using cat to read from file
cat < input.txt

echo "End of script."
