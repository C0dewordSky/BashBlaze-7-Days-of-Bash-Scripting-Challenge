#!/bin/bash

display_usage(){
  echo "Usage: $0 [OPTIONS]"
    echo "Options:"
    echo "  -c, --create     Create a new user account."
    echo "  -d, --delete     Delete an existing user account."
    echo "  -r, --reset      Reset password for an existing user account."
    echo "  -l, --list       List all user accounts on the system."
    echo "  -h, --help       Display this help and exit."

}

check_user(){
    echo "Enter a UserName: "
    read userName
    if grep -q "$userName" /etc/passwd; then
    return 0
    else 
    return 1
    fi
}

#Part 1 User Account Creation 

create_user() {

echo "Enter the Name of the User you want to add: "

read userName

if grep -q "$userNmae" /etc/passwd; then
  echo "User already exists"
else
echo " Creating User with name "$userName". "
  useradd -c "$userNmae"
  echo " Created User with name "$UserName". "
 
fi
}
#Part 2 Account Deletion 

delete_user() {
echo "Enter the username you want tot Delete: "

read delName

if grep -q "$delName" /etc/passwd; then
  echo "Deleting user "$delName". "
  userdel -d "$delName"
  echo " "$delName" account deleted."

  else 

   echo "Username not found"
fi
}

password_reset(){
    echo "Enter the username for which you want to reset the password: "
    
    if check_user; then 
    echo "Changing your password. "
    passwd "$userName" 
    echo "Your password is changed. "
    else
    echo "User doesn't exist."
    fi  
}

list_userAccount() {
    echo " Listing all users on the system. "
    awk -F '{print "userName: " $1 "\tUID: " $3}' /etc/passwd
}

 #command_line Argument Parsing

 if [ $# -eq 0 ] || [ "$1" = "-h" ] || [ "$1" = "--help" ]; then 
 display_usage
 exit 0
 fi

 #command_line Argument Parsing 

 while [ $# -gt 0 ]; do
   case "$1" in
         -d|--delete)
         delete_user
         ;;
         -c|--create)
         create_user
         ;;
         -r|--reset)
         reset_password
         ;;
         -l|--list)
         list_userAccount
         ;;
         *)

         echo "Error: Invalid option '$1'. Use '--help' to see available options. "
          exit 1
          ;;
          esac