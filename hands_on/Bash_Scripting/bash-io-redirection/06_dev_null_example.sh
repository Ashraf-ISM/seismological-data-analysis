#!/bin/bash
# ==========================================
# Script Name: 06_dev_null_example.sh
# Description: Demonstrates /dev/null usage
# ==========================================

echo "Running command silently..."

ls nonexistent_file &> /dev/null

echo "No error displayed because output was discarded."
