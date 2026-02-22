#!/bin/bash
# =====================================================
# Script Name: ashraf_md_hw3.bash
# Author: Md Ashraf
# Description:
#   This script appends the current date (YYYYMMDD)
#   to the end of a given filename.
#
# Usage:
#   ./ashraf_md_hw3.bash filename
#
# Example:
#   ./ashraf_md_hw3.bash my_file.txt
#   Output: my_file.txt.20260222
# =====================================================

# -----------------------------
# Step 1: Check if argument exists
# -----------------------------
if [ $# -ne 1 ]; then
    echo "Error: Please provide exactly one filename."
    echo "Usage: $0 filename"
    exit 1
fi

# -----------------------------
# Step 2: Store input filename
# -----------------------------
filename="$1"

# -----------------------------
# Step 3: Check if file exists
# -----------------------------
if [ ! -f "$filename" ]; then
    echo "Error: File '$filename' does not exist."
    exit 1
fi

# -----------------------------
# Step 4: Get current date
# -----------------------------
current_date=$(date +%Y%m%d)

# -----------------------------
# Step 5: Create new filename
# -----------------------------
new_filename="${filename}.${current_date}"

# -----------------------------
# Step 6: Rename the file
# -----------------------------
mv "$filename" "$new_filename"

# -----------------------------
# Step 7: Confirmation message
# -----------------------------
echo "File successfully renamed to: $new_filename"
