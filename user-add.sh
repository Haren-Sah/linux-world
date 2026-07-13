#!/bin/bash

#This script create a new user and create password for the user
# force the user to create new password on first login

#Ask for User name

read -p 'Enter the User Name: ' USERNAME
echo "username : ${USERNAME}"

#Ask for the real name

read -p 'Enter the Real name of the user: ' REALNAME
echo "real name of the user: ${REALNAME}"

#Ask for the password

read -p 'Enter the password for the user: ' PASSWORD
echo "password for the user: ${PASSWORD}"

#Create the user

useradd -c "${REALNAME}" -m "${USERNAME}"

#checking if the user is added

if [[ "${?}" -eq 0 ]]
then
        echo "${USERNAME} is CREATED!"
else
        echo "${USERNAME} is NOT CREATED!"
        echo "last exit code is ${?}"
        exit
fi

#Set the password for the user

echo "${PASSWORD}" | passwd --stdin  "${USERNAME}"



if [[ "${?}" -eq 0 ]]
then
        echo "password for user ${USERNAME} is created"
else
        echo "some error setting password for the user ${USERNAME}"
        exit
fi

#Force password change on the first login attempt

passwd -e "${USERNAME}"

if [[ "${?}" -eq 0 ]]
then
        echo "${USERNAME}  will be forced to update password on first login"
else
        echo "some error setting up password reset"
        exit
fi
