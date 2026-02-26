#!/bin/bash

echo -n "Enter the number for the factorial: "
read num

fact=1
n=$num

# Check negative
if [ "$num" -lt 0 ]; then
    echo "Factorial is not defined for negative numbers."
    exit 1
fi

# While loop
while [ "$n" -gt 1 ]; do
    fact=$((fact * n))
    n=$((n - 1))
done

echo "Factorial of $num is $fact"
