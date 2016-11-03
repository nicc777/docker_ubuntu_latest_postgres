FROM ubuntu:latest
MAINTAINER nicc777@gmail.com

RUN apt-get update
RUN apt-get install -y postgresql postgresql-contrib


RUN mkdir /opt/scripts
COPY opt/scripts/* /opt/scripts/
RUN chmod 750 /opt/scripts/*.sh
RUN chmod 644 /opt/scripts/*.sql

VOLUME  ["/etc/postgresql", "/var/log/postgresql", "/var/lib/postgresql", "/opt"]

CMD ["/opt/scripts/start_db.sh"]

