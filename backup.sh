#!/bin/bash
#command line attributes:
# $1 BACKUP_DIR - local directory for temporary storage file of old current version 
# $2 WORK_DIR - local directory of current version

if [[ $# -eq 3 ]]; then
    
    BACKUP_DIR=$1
    WORK_DIR=$2

	#3. вернуть файлы прошлой версии
	rsync -rvz $BACKUP_DIR/ $WORK_DIR
	echo 'OK'
	exit

else
    echo 'ERROR'
    exit
fi;