#!/bin/bash

# This script prints the filename with current date appended.
# Example: script.sh myfile.txt
# Output: myfile.txt20260222

# Get filename from argument
filename="$1"

# Get current date in YYYYMMDD format
current_date=$(date +%Y%m%d)

# Create new name
new_name="${filename}${current_date}"

echo "The required result is $new_name"
