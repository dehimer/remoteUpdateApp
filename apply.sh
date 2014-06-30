#!/bin/bash
#command line attributes:
# $1 BACKUP_DIR - local directory for temporary storage file of old current version 
# $2 UPDATE_DIR - local directory, where will be store new update
# $3 WORK_DIR - local directory of current version

if [[ $# -eq 2 ]]; then
    
    UPDATE_DIR=$1
    WORK_DIR=$2


	#перенести обновление в папку work 
	rsync -rz -t $UPDATE_DIR/ $WORK_DIR
	if [[ $? -eq 0 ]]; then
		echo 'OK'
	else
		echo 'ERROR1'
	fi
	exit

else
    echo 'ERROR2'
    exit
fi;

