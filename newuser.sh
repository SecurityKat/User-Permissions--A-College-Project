
#"/bin/bash
#Determine if the value entered is secure
function badwords() {
x=1
#Set loop equal to the total number of badwords
while [ $x -le 3 ];
 do 
#Enter badwords in the following array
array=("root" "admin" "$" )
string=$1
substring=${array[$x-1]}
if [[ "$substring" == *"$string"* ]]; then
echo "Invalid user name. Program terminated"
exit
else
echo "Please continue"
fi
x=$(($x + 1))
done
}
#Compare function
function compare() {
if [ $1 = "yes" ]; then
echo "You entered $1"
else
echo "You entered an incorrect value"
fi
}
function validate() {
rm checkuser.txt
cat /etc/passwd | grep $1 > checkuser.txt
if [ -s checkuser.txt ]; then
echo "$1 has been created"
else
echo "You have not created a new user account for $1"
fi
}
# Part 2 -----
#Confirm this code will add new users
echo "This code adds users." 
echo "Confirm you wish to continue by typing yes"
read ans
if [ $ans = "yes" ]; then
#Enter details to create a user account
echo "Enter the first user name you wish to add"
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
#Verify the user id is not an invalid word or character
badwords $userid
#Create user
echo "Enter base group"
read groupid
groupadd $groupid
useradd -d /home/$userid -e 2016-01-01 -g $groupid $userid
#Confirm user creation has been successful
validate $userid# Create another user
echo "Enter yes if you wish to create another user"
read another
if [ $another = "yes" ]; then
#Enter details to create another user account
echo "Enter the name of the next user to be created"
read userid
echo "You have entered $userid. Type Yes to confirm"
read reply
compare $reply
else
stop=1
fi
done
#Finished creating user accounts. End program.
echo "The program has finished processing"
exit
#End of Program







