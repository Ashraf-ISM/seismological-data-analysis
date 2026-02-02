#!/bin/bash
b=$((1+2))
a=$((b+2))
c=`$((a+1.13 | bc)`
#c=$((a+1.13 | bc)
echo $b $a $c
