FROM ubuntu:latest
MAINTAINER nicc777@gmail.com

RUN apt-get update
RUN apt-get upgrade -y
RUN apt-get install -y postgresql postgresql-contrib
RUN mkdir /opt/scripts
COPY scripts/* /opt/scripts/
RUN chmod 750 /opt/scripts/*.sh

RUN mkdir /opt/backups
VOLUME ['/opt/backups'] 

EXPOSE 5432

ENV TZ=Africa/Johannesburg
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

CMD ["sh", "/opt/scripts/start_db.sh"]

