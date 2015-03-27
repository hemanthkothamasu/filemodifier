#!/bin/bash

# If only one file or no file specified, show short usage prompt and exit with non-zero exit code
if [ $# -lt 2 ] 
then
  echo "Usage: `basename $0` <file1> <file2>"
  exit 255
fi
#Given arguments are copied to variables inorder to sort the files from one file to other
_file1=$1 # 1st file to process
_file2=$2 # 2nd file to process

# Print the result
grep -Ev "$(echo -n "("; echo -n $(cat ${_file2}) | sed 's/\s/|/g'; echo ")")" ${_file1}
# 1 2 3 3 2 1 - checking parentheses balance. It's OK
#Those values can be taken for transferring the .profile file for the users without the .profile file
