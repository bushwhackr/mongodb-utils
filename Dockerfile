FROM ubuntu:jammy

ARG DEBIAN_FRONTEND=noninteractive

# https://www.mongodb.com/try/download/shell
ENV MONGODB_SHELL_VERSION 1.10.6
# https://www.mongodb.com/try/download/database-tools
ENV MONGODB_TOOLS_VERSION 100.8.0

RUN apt-get update &&\
    apt-get -y install wget &&\
    wget https://fastdl.mongodb.org/tools/db/mongodb-database-tools-ubuntu2204-$(dpkg --print-architecture)-${MONGODB_TOOLS_VERSION}.deb && \
    wget https://downloads.mongodb.com/compass/mongodb-mongosh_${MONGODB_SHELL_VERSION}_$(dpkg --print-architecture).deb && \
    dpkg -i mongodb-database-tools-ubuntu2204-$(dpkg --print-architecture)-${MONGODB_TOOLS_VERSION}.deb && \
    dpkg -i mongodb-mongosh_${MONGODB_SHELL_VERSION}_$(dpkg --print-architecture).deb && \
    rm mongodb-database-tools-ubuntu2204-$(dpkg --print-architecture)-${MONGODB_TOOLS_VERSION}.deb && \
    rm mongodb-mongosh_${MONGODB_SHELL_VERSION}_$(dpkg --print-architecture).deb && \
    rm -rf /var/lib/apt/lists/*

USER nobody
