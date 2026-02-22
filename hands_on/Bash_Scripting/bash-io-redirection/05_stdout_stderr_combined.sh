#!/bin/bash
# ==========================================
# Script Name: 05_stdout_stderr_combined.sh
# Description: Redirect both stdout and stderr
# ==========================================

echo "Running command with mixed output..."

{
    echo "This is normal output"
    ls nonexistent_file
} &> combined.log

echo "Both stdout and stderr saved to combined.log"
