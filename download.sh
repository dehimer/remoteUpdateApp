#!/bin/bash
#command line attributes:
# $1 HOST - user_name@host_ip
# $2 HOST_DIR - directory on host, where located update
# $3 UPDATE_DIR - local directory, where will be store new update

if [[ $# -eq 5 ]]; then
    
    HOST=$1
    HOST_DIR=$2
    UPDATE_DIR=$3
	BACKUP_DIR=$4
	EXCLUDE_FROM=$5
	

	#2. проверить доступность сервера
	# ssh -q $HOST exit

	#1 опустошить backup
	rm -r $BACKUP_DIR
	mkdir $BACKUP_DIR

	#1. получить обновления в папку update
	rsync -rz -t --delete $HOST:$HOST_DIR/ $UPDATE_DIR --exclude-from=$EXCLUDE_FROM --backup --backup-dir=$BACKUP_DIR
		
	if [[ $? -eq 0 ]]; then
		echo 'OK'
	else
		echo 'ERROR1'
	fi
	exit
else
    echo 'ERROR3'
    exit
fi;