#!/bin/sh

if [ -d "$DATA_DIR" ] 
then
	echo "Using Custom Data Directory (may be external to the container)"
	if [ ! -e "$DATA_DIR/postgresql_prepped" ]
	then
		sudo -u postgres `locate initdb | grep bin | grep postgres | head -1` --encoding=$DATA_ENCODING  --locale=$DATA_LOCALE -D $DATA_DIR 
		touch $DATA_DIR/postgresql_prepped
    		echo "host all  all    0.0.0.0/0  md5" >> $DATA_DIR/pg_hba.conf
    		echo "listen_addresses='*'" >> $DATA_DIR/postgresql.conf
		sudo -u postgres `locate pg_ctl | grep bin | grep postgres | head -1` start -D $DATA_DIR
    		sleep 5
    		su -l postgres -c "psql -f /opt/scripts/create_user.sql"
    		su -l postgres -c "createdb -O docker docker"
    		echo "PostgreSQL is ready for use [3]"
	else
		sudo -u postgres `locate pg_ctl | grep bin | grep postgres | head -1` start -D $DATA_DIR
    		echo "PostgreSQL is ready for use [4]"
	fi
else
	if [ -e "/opt/scripts/postgresql_prepped" ]
	then
    		service postgresql start
    		echo "PostgreSQL is ready for use [1]"
	else
    		echo "Preparing PostgreSQL for first use"
    		service postgresql stop
    		echo "host all  all    0.0.0.0/0  md5" >> /etc/postgresql/`ls -l /etc/postgresql | awk '{print $9}' | sort -nr | head -1`/main/pg_hba.conf
    		echo "listen_addresses='*'" >> /etc/postgresql/`ls -l /etc/postgresql | awk '{print $9}' | sort -nr | head -1`/main/postgresql.conf
    		service postgresql start
    		sleep 5
    		su -l postgres -c "psql -f /opt/scripts/create_user.sql"
    		su -l postgres -c "createdb -O docker docker"
    		touch /opt/scripts/postgresql_prepped
    		echo "PostgreSQL is ready for use [2]"
	fi
fi

if [ -e "/opt/backups/backup.sql" ]
then
	su -l postgres -c "psql -d docker -f /opt/backups/backup.sql"
	echo "Backup Restored"
else
	echo "No backup found - starting with a clean DB"
fi

while [ 1 ]; do
    sleep 60
done


