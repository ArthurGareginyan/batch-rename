#!/bin/bash
#=============================================================#
# Name:         Batch Rename                                  #
# Description:  Batch rename files and directories            #
#               recursively.                                  #
# Version:      ver 1.0                                       #
# Released:     1.05.2020                                     #
# Updated:      1.05.2020                                     #
# Author:       Arthur Gareginyan                             #
# Author URI:   https://www.arthurgareginyan.com              #
# Email:        arthurgareginyan@gmail.com                    #
# License:      MIT License                                   #
# License URI:  http://opensource.org/licenses/MIT            #
#=============================================================#

#               	USAGE:
#		chmod +x batch_rename.sh
#		cd /home/user/example
#		~/batch_rename.sh "find_this" "replace_with_this"

# Check for proper priveliges
[ "`whoami`" = root ] || exec sudo "$0" "$@"


####################### DIALOG ############################
echo -en "\n BEWARE! Starting from current directory (`pwd`),"
echo -en " files and directories will be renamed automatically.\n"
echo -en "\n Press \"ENTER\" to continue or \"N\" to exit:"
read ops
case "$ops" in
    n|N)
        echo -en "\n Canceled by User. Exiting...\n"
        exit 1 ;;
    *)
        echo -en "\n Begining...\n" ;;
esac


################### SETUP VARIABLES #######################
number=0                    # Number of renamed.
number_not=0		        # Number of not renamed.
IFS=$'\n'
array=( `find ./ -type d` ) # Find catalogs recursively.


######################## GO ###############################
# Reverse cycle.
for (( i = ${#array[@]}; i; ));
do
    # Go in to catalog.
    pushd "${array[--i]}" >/dev/null 2>&1
    # Search of all files in the current directory.
    for name in *
    do
     	# Check for spaces in names of files and directories.
	    echo "$name" | grep -q "$1"
	    if [ $? -eq 0 ]
	       then
	     	# Renaming.
	        newname=`echo $name | sed -e "s/$1/$2/g"`
    		if [ -e $newname ]
            	then
    			    let "number_not +=1"
                    echo " Not renaming: $name"
            	else
            		# Plus one to number.
                	let "number += 1"
                    # Message about rename.
                	echo "$number Renaming: ${array[i]}/$name"
                	# Rename.
    		        mv "$name" "$newname"
    		fi
	    fi
    done
    # Go back.
    popd >/dev/null 2>&1
done

echo -en "\n All operations is complited."

if [ "$number_not" -ne "0" ]
    then
        echo -en "\n $number_not not renamed."
fi

if [ "$number" -eq "0" ]
    then
        echo -en "\n Nothing been renamed.\n"
elif [ "$number" -eq "1" ]
   then
       echo -en "\n $number renamed.\n"
   else
       echo -en "\n Renamed files and catalogs: $number\n"
fi

exit 0
