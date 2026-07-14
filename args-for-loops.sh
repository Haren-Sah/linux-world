#!/bin/bash

#Number of arguements passed

echo "Number of arguements passed: ${#}"

#generate and display password for each username passed

for USERNAME in "${@}"
do
        PASSWORD=$(date +%s%N | sha256sum | head -c24)
        echo "${USERNAME}: ${PASSWORD}"
done

#Expected output in the range
#[vagrant@servera ~]$ ./args-for-loops.sh apple ball cat dog
#Number of arguements passed: 4
#apple: f0dfcb4fca9a95aee034edec
#ball: e1de253fc362f8c030c38fee
#cat: 90bd11ede66368d21278c992
#dog: 7a83c18fb1dc3221f59e068e
