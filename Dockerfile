FROM python:3.9.1-buster
LABEL maintainer="dmitriym.09.12.1989@gmail.com"

RUN apt-get update && apt-get install -y locales && rm -rf /var/lib/apt/lists/* \
    && localedef -i en_US -c -f UTF-8 -A /usr/share/locale/locale.alias en_US.UTF-8
ENV LANG en_US.utf8

RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get -y -q install software-properties-common && \
    apt-get update

RUN apt-get -y -q install \
        g++ \
        unixodbc unixodbc-dev freetds-dev tdsodbc python3-dev && \
    rm -rf /var/lib/apt/lists/*

COPY ./odbcinst.ini /etc/odbcinst.ini
