FROM ubuntu:latest
MAINTAINER nicc777@gmail.com

RUN apt-get update
RUN apt-get install -y postgresql postgresql-contrib

RUN systemctl enable postgresql
RUN systemctl stop postgresql

USER postgres


#RUN echo "host all  all    0.0.0.0/0  md5" >> /etc/postgresql/9.3/main/pg_hba.conf
#RUN echo "listen_addresses='*'" >> /etc/postgresql/9.3/main/postgresql.conf
EXPOSE 5432

RUN systemctl start postgresql

RUN psql --command "CREATE USER docker WITH SUPERUSER PASSWORD 'docker';" && createdb -O docker docker

VOLUME  ["/etc/postgresql", "/var/log/postgresql", "/var/lib/postgresql"]

#CMD ["/usr/lib/postgresql/9.3/bin/postgres", "-D", "/var/lib/postgresql/9.3/main", "-c", "config_file=/etc/postgresql/9.3/main/postgresql.conf"]
