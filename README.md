# PostgreSQL as a Docker Services on Ubuntu Image (Latest)

This repository contains a Dockerfile to attempt to always have an up-to-date method of building an image with the latest Ubuntu version and PostgreSQL database server from the official Ubuntu repository.

It is based on the example from https://docs.docker.com/engine/examples/postgresql_service/

It is work on progress and mostly for myself to learn more about Docker.

## Building the Image

The build process can be started with the familiar:

    docker build -t ubuntu_postgresql:latest .

The latest updates for Ubuntu will be installed as well as PostgreSQL from the Ubuntu repo.

## Start an image

Starting the image is again very straight forward

    docker run -p 127.0.0.1:5432:5432 -d -t ubuntu_postgresql:latest

It will start the container and PostgreSQL which will now listen on localhost port 5432 - change this to suite your needs


