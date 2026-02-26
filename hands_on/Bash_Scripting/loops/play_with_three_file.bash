#!/bin/bash

#  In the following example, if the file meets a condition,then the loop will skip to the next iteration.
#If it doesn't it will execute a command.

for file in *;do

 echo " "
 echo "file is = $file "
 file_suffix=`echo $file | cut -d. -f2 `
 echo "file_suffix = $file_suffix"
 if [ "$file_suffix" == "seismogram" ];then
  echo "$file is a seismogram; let's process this file"
  continue
 fi
 echo "$file is not a seismogram, will ignore"
done
