FROM ubuntu:latest
MAINTAINER nicc777@gmail.com

ENV DATA_DIR default
ENV DATA_LOCALE en_US.UTF-8
ENV DATA_ENCODING UTF8

RUN apt-get update
RUN apt-get upgrade -y
RUN apt-get install -y postgresql postgresql-contrib sudo mlocate

RUN updatedb
RUN locale-gen en_US.UTF-8
RUN update-locale

RUN mkdir /opt/scripts
COPY scripts/* /opt/scripts/
RUN chmod 750 /opt/scripts/*.sh

RUN mkdir -p /opt/backups /opt/data
VOLUME ['/opt/backups', '/opt/data'] 

EXPOSE 5432

ENV TZ=Africa/Johannesburg
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

CMD ["sh", "/opt/scripts/start_db.sh"]

