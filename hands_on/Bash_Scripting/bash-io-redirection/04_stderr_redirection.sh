#!/bin/bash
# ==========================================
# Script Name: 04_stderr_redirection.sh
# Description: Demonstrates stderr redirection
# ==========================================

echo "Trying to list a non-existing file..."

ls nonexistent_file 2> error.log

echo "Error saved to error.log"
