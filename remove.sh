#!/bin/bash
function compare() {
if [ $1 = "yes" ]; then
echo "You entered $1"
else
echo "You entered an incorrect value"
fi
}
function validate() {

#Set the checkuser.txt file to empty.
rm checkuser.txt
#Look in /etc/passwd for the user, and move the details to checkuser.txt.
cat /etc/passwd | grep $1 > checkuser.txt
#Return a true value if the user has not been deleted
if [ -s checkuser.txt ]; then
echo "$1 has not been deleted"
#Validates that the user has been deleted, unless the user never existed.
else
echo "Unless otherwise notified, you have succesfully deleted $1"
fi
}
# Part 3 -----
#Confirm this code will permanently delete users
echo "This code deletes users permanently." 
echo "Confirm you wish to continue by typing yes"
read ans
if [ $ans = "yes" ]; then
#Enter details to remove a user account
echo "Enter the first user name you wish to delete"
read userid
echo "You have entered $userid. Type yes to continue"
read reply
compare $reply
else
echo "Program terminated"
exit
fi
stop=0
while [ $stop -eq 0 ]
do
#Delete user
userdel -r $userid
#Confirm deletion has been successful
validate $userid
 #Delete another user
echo "Enter yes if you wish to delete another user"
read another
if [ $another = "yes" ]; then
#Enter details to delete another user account
echo "Enter the name of the next user to delete"
read userid
echo "You have entered $userid. Type Yes to confirm"
read reply
compare $reply
else
stop=1
fi
done
#Finished deleting user accounts. End program.
echo "The program has finished processing"
#End of Program
