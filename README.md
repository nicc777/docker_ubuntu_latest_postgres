# PostgreSQL as a Docker Services on Ubuntu Image (Latest)

This repository contains a Dockerfile to attempt to always have an up-to-date method of building an image with the latest Ubuntu version and PostgreSQL database server from the official Ubuntu repository.

I originally looked at the example from https://docs.docker.com/engine/examples/postgresql_service/ but I decided I wanted to try it from scratch myself. 

It is work on progress and mostly for myself to learn more about Docker, however it is now in a usable state.

The database data is NOT persisted and you have to ensure you make a backup of your data before you stop the instance if you would like to keep your data. I did this specifically for container re-use.

## Default Credentials

The script `scripts/start_db.sh` will create a database `docker` with username `docker` and password `docker` - to change any of these, update the script before the initial build.

## Building the Image

The build process can be started with the familiar:

    $ docker build -t ubuntu_postgresql:latest .

The latest updates for Ubuntu will be installed as well as PostgreSQL from the Ubuntu repo.

## Start an image

Starting the image is again very straight forward

    $ docker run -p 127.0.0.1:5432:5432 -d -t ubuntu_postgresql:latest

It will start the container and PostgreSQL which will now listen on localhost port 5432 - change this to suite your needs

## Get a shell to the instance

You can run the following commands to get a shell into the running instance:

    docker ps
    CONTAINER ID        IMAGE                      COMMAND                  CREATED             STATUS              PORTS                      NAMES
    841b2bcca536        ubuntu_postgresql:latest   "sh /opt/scripts/star"   2 minutes ago       Up 2 minutes        127.0.0.1:5432->5432/tcp   __NAME__
    $ docker exec -i -t __NAME__ /bin/bash

## Backup and Restoring Data

You can mount your local backups and the "run" command will automatically restore the file `backup.sql`

    $ docker run -v /path_to_backups:/opt/backups -p 127.0.0.1:5432:5432 -d -t ubuntu_postgresql:latest

If you use the backup file from the repo, you should be able to do something like the following:

    $ psql -U docker -W -d docker -h 127.0.0.1 -p 5432
    Password for user docker: 
    psql (9.5.4, server 9.5.5)
    SSL connection (protocol: TLSv1.2, cipher: ECDHE-RSA-AES256-GCM-SHA384, bits: 256, compression: off)
    Type "help" for help.
    
    docker=# \d
                      List of relations
     Schema |          Name          |   Type   | Owner  
    --------+------------------------+----------+--------
     public | test_table             | table    | docker
     public | test_table_test_id_seq | sequence | docker
    (2 rows)
    
    docker=# select * from test_table;
     test_id | test_key | test_value 
    ---------+----------+------------
           1 | key_1    | Value 1
           2 | key_2    | Value 2
           3 | key_3    | Value 3
    (3 rows)
    
    docker=# \q

Note: The connection was from the host, so for this to work you would need to install or have access to the `psql` command.

