# PostgreSQL as a Docker Services on Ubuntu Image (Latest)

This repository contains a Dockerfile to attempt to always have an up-to-date method of building an image with the latest Ubuntu version and PostgreSQL database server from the official Ubuntu repository.

It is based on the example from https://docs.docker.com/engine/examples/postgresql_service/

It is work on progress and mostly for myself to learn more about Docker.

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

