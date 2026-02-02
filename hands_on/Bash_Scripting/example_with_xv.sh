
#!/bin/bash -xv
set -xv
# Here is the description of why we are using -xv and what it does/

echo "Here  v stands for the verbose.This prints each line of the script whatever we written in the bash file and also it happens before execution."

# Now let us understand what does x here. 
# -x means the execution trace. It shows expanded command.Also here variable get replaced by their values.

name="Ashraf"

echo " Hello $name."

