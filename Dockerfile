FROM ubuntu:latest
MAINTAINER nicc777@gmail.com

RUN mkdir /opt/scripts

EXPOSE 5432

VOLUME  ["/etc/postgresql", "/var/log/postgresql", "/var/lib/postgresql", "/opt"]

CMD ["sh", "/opt/scripts/start_db.sh"]

