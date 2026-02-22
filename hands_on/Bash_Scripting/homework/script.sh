#!/bin/bash

# This script should be written such that when it will run then it print the myfile.txt+current date.
# E.g myfile.txt20260222 should be when the script is run as script.sh myfile.txt

# Take the filename from command line
filename=$1

# Get current date in YYYYMMDD format
today=$(date +%Y%m%d)

# Rename the file by appending the date
mv "$filename" "$filename.$today"

echo "File renamed to: $filename.$today"
