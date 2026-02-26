#!/bin/bash

clear
echo "Initializing Secure Terminal..."
sleep 1

# Fake loading bar
for i in {1..20}
do
    echo -ne "["
    for j in $(seq 1 $i); do echo -ne "#"; done
    for j in $(seq $i 20); do echo -ne " "; done
    echo -ne "] $((i*5))% \r"
    sleep 0.1
done
echo -e "\n"

sleep 1
echo "Establishing encrypted channel..."
sleep 1

# Fake encryption effect
for i in {1..50}
do
    tr -dc A-F0-9 </dev/urandom | head -c 40
    echo
    sleep 0.05
done

sleep 1
clear

echo "Accessing remote seismic node..."
sleep 1
echo "Injecting payload..."
sleep 1
echo "Decrypting seismic headers..."
sleep 1

# Random scrolling code effect
for i in {1..30}
do
    tr -dc 'a-zA-Z0-9{}();<>[]+=' </dev/urandom | head -c 60
    echo
    sleep 0.03
done

sleep 1
echo ""
echo "ACCESS GRANTED"
echo "Welcome, Ashraf 🔥"
