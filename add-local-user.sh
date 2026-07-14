#!/bin/bash

# The file should be executed by superuser (root) priviledge
#if not, exit by status 1

if [[ $(id -u) -ne 0 ]]
then
        echo "Error: File executed only by superuser"
        exit 1
fi

#Enter the User name

read -p 'Enter the User Name: ' USERNAME


#Name of the person using the account

read -p 'Enter the name of the person using the account: ' REALNAME


#Enter the initial password

read -p 'Enter the intiail password: ' PASSWORD

#create a new user with info provided

useradd -c "${REAlNAME}" -m "${USERNAME}"

#inform the user if the account is not created by some reason and exit by status 1

if [[ "${?}" -ne 0 ]]
then
        echo "the account of user ${USERNAME} is not created"
        exit 1
fi

#set the password for the user

echo "${PASSWORD}" | passwd --stdin "${USERNAME}"

#display username

echo "Username: ${USERNAME}"

#Display password

echo "password: ${PASSWORD}"

#Display host where the account is created

echo "The host account was created on: $(hostname)"
