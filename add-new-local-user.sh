#!/bin/bash

#Enforce script is executed with superuser priviledge

if [[ ${UID} -ne 0 ]]
then
        echo "Execute this script with superuser priviledge"
        exit 1
fi


#Provide man page style usage statement if no arguement is provided

if [[ "${#}" -lt 1 ]]
then
        echo "Error Passing Arguements."
        echo "Use following format."
        echo "filename username comment"
        exit 1
fi


#Use first arguement of command line as username and rest as comment

USERNAME=${1}
COMMENT=${2}

#Automaticallty generate password

PASSWORD=$(date +%s%N | sha256sum | head -c10)


#return exit status 1 and inform user if password is not crated

if [[ "${?}" -ne 0 ]]
then
        echo "password not generated."
        exit 1
fi

#Display username password and hostname

echo "Username: ${USERNAME}"
echo "Password: ${PASSWORD}"
echo "Hostname: $(hostname)"
