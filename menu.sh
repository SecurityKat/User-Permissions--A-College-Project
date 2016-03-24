#!/bin/bash

# Write menu options to the console

OPTIONS="readin newuser submenu deleteuser quit"

select opt in $OPTIONS; do

if [ $opt = "readin" ]; then

echo "$opt selected: Users will be read in from a file called users.txt"

#./readin.sh users.txt

./readin.sh users.txt

echo "Choose another option from the menu"

elif [ $opt = "newuser" ]; then

echo "$opt selected:  A new user can be entered from the console"
#.newuser.sh

echo "Choose another option from the menu"

elif [ $opt = "submenu" ]; then

echo "$opt selected: Modify user details"


./choice.tsh


echo "Choose another option from the menu"

elif [ $opt = "deleteuser" ]; then

echo "$opt selected: Delete a user"

./remove.sh
echo "Choose another option from the menu"

elif [ $opt = "quit" ]; then

echo "$opt selected quit"

exit

else

echo "bad option selected"

exit

fi

done


#End of Program

