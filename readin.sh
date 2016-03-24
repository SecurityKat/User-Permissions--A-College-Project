#!/bin/bash

#Part 1
#Import user data from data file. Enter the command ./readin.sh users.txt from the CLI
FILENAME=$1
cat $FILENAME | while read line
do
#For each user, create a user account and allocate to a group
#Declare and store local variables for each element of the line array
array=( $line)
fname=${array[0]}
userid=${array[1]}
groupid=${array[2]}
passinit=${array[3]}
#Create user accounts with initial group, password and expiry date
groupadd $groupid
useradd -e 2016-01-01 -g $groupid $userid
# Set instruction to user to change password, for first login
#passwd -e $passinit
done
#End of Program
