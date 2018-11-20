# ByteMatrix Viewer
#
# Version 1.0.0

FROM mariadb:latest
MAINTAINER support@bytematrix.io

COPY ./etc /etc

RUN apt-get update
RUN apt-get install -y locales
RUN rm -rf /var/lib/apt/lists/* $
RUN localedef -i en_US -c -f UTF-8 -A /usr/share/locale/locale.alias en_US.UTF-8

ENV LANG en_US.utf8