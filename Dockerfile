FROM ubuntu:latest
MAINTAINER nicc777@gmail.com

RUN apt-get update
RUN apt-get upgrade -y
RUN apt-get install -y postgresql postgresql-contrib
RUN mkdir /opt/scripts
COPY scripts/* /opt/scripts/
RUN chmod 750 /opt/scripts/*.sh

EXPOSE 5432

CMD ["sh", "/opt/scripts/start_db.sh"]

