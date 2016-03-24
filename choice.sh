#!/bin/bash
# This function confirms the username has been entered correctly
function compare() {
if [ $1 = "yes" ]; then
echo "You entered $1"
else
echo "You entered an incorrect value"
fi
}
# This function validates the useris already in the /etc/passwd file
#If invalid, the program is terminated
function validate() {
rm checkuser.txt
cat /etc/passwd | grep $1 > checkuser.txt
if [ -s checkuser.txt ]; then
echo "The user you entered is valid"
else
echo "The user name you entered is invalid. Program terminated"
exit
fi
}
#Part 3------
echo "Enter the name of the user you wish to modify"
read user
echo "You entered $user. Confirm by typing yes"
read reply
compare $reply
#Check if the user is contained in the user file
validate $user
#Check if the user name is a badword (root, admin, $)
#badwords $user
#Write choices to the console
echo "Modify user account by choosing one of the following options"
options=("change user id" "change group id" "add a group" "change user pass id" "change expiry date" "lock user" "unlock user" "quit")

select opt in "${options[@]}"; do
echo "You selected $opt"
#Change user name
if [ "$opt" = "change user id" ]; then
echo "Enter new user name"
read newuserid
echo "You entered $newuserid: Please confirm by typing Yes"
read reply
echo "confirm $reply"
usermod -d /home/$newuserid $user
echo "You have changed the user name from $user to $newuserid"
exit
#Change base group
elif [ "$opt" = "change group id" ]; then
echo "Enter new base group"
read groupid
usermod -g $groupid $user
echo "you have changed the base group to $groupid"
exit
# Add user group to base group
elif [ "$opt" = "add a group" ]; then
echo "Add another group"
read $groupadd
usermod -G $groupadd $user 
echo "You have added $groupadd to $user"
exit
#Change password
elif [ "$opt" = "change user pass id" ]; then
echo "Please enter new password"
read passid
usermod $passid $user
echo "Password has been changed for $user to $passid"
exit
#Change user expiry date
elif [ "$opt" = "change expiry date" ]; then
#Enter new expiry date
echo "Enter new expiry date in the format mm/dd/yyyy"
read expiry
usermod -e $expiry $user
echo "User expiry date has been changed to $expiry"
exit
# Lock user.
elif [ "$opt" = "lock user" ]; then
user -L $user
echo "User $user locked"
exit
# Unlock user
elif [ "$opt" = "unlock user" ]; then
user -U $user
echo "User $user unlocked"
exit
elif [ "$opt" = "quit" ]; then
"You entered $opt"
exit

else
clear
echo "You have entered an incorrect value. Program terminated"
exit
fi
done
echo "Processing complete. Program terminated"
#End of Program



