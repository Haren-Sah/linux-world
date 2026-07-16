#!/bin/bash

# -d:
# -v verbose
# -h help
# after the flags, script must accept at one or more file to backup
#no files after flags, exit with 1
#create destinaton directory for back up
#copy file to destination directory
# if -v is enabled, print copying [file] to [destination]

# ./backup -d /tmp/scripts/bups -v sample.sh add-local-user.sh

VERBOSE=false
BACKUP_DIRECTORY="/tmp/backup"
while getopts ":d:vhabc" opts ; do
        case $opts in
                d )
                        BACKUP_DIRECTORY=${OPTARG}
                        ;;
                v )
                        VERBOSE=true
                        ;;
                h )
                        echo "Usage: file [-d [dir]] [-v] [-h] file-to-backup [...]"
                        exit 1
                        ;;
                a )
                        ;;
                b )
                        ;;

                \? )
                        echo "Invalid options."
                        exit 1
                        ;;
                : )
                        echo "${OPTARG} needs value."
                        exit 1
                        ;;
        esac
done

if [[ ! (-d "$BACKUP_DIRECTORY/") ]]; then
        (mkdir -p "$BACKUP_DIRECTORY/")
fi
shift $((OPTIND - 1))
for args in "${@}" ; do
        echo "arg1: ${args}"
        cp $args "$BACKUP_DIRECTORY/"
        echo " $args file is copied to $BACKUP_DIRECTORY dir "
done
                    
