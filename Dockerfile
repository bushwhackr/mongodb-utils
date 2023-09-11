FROM ubuntu:jammy

ARG DEBIAN_FRONTEND=noninteractive

# https://www.mongodb.com/try/download/shell
ARG MONGODB_SHELL_VERSION
# https://www.mongodb.com/try/download/database-tools
ARG MONGODB_TOOLS_VERSION

# Get the architecture of the current machine
# Replacing amd64 with x86_64 for compatibility with MongoDB's database tools naming scheme
RUN DPKGARCH_TOOLS="$(dpkg --print-architecture | sed 's/amd64/x86_64/g')" && \
    DPKGARCH_SHELL="$(dpkg --print-architecture)" && \
    apt-get update && \
    apt-get -y install wget && \
    wget https://fastdl.mongodb.org/tools/db/mongodb-database-tools-ubuntu2204-${DPKGARCH_TOOLS}-${MONGODB_TOOLS_VERSION}.deb && \
    wget https://downloads.mongodb.com/compass/mongodb-mongosh_${MONGODB_SHELL_VERSION}_${DPKGARCH_SHELL}.deb && \
    dpkg -i mongodb-database-tools-ubuntu2204-${DPKGARCH_TOOLS}-${MONGODB_TOOLS_VERSION}.deb && \
    dpkg -i mongodb-mongosh_${MONGODB_SHELL_VERSION}_${DPKGARCH_SHELL}.deb && \
    rm mongodb-database-tools-ubuntu2204-${DPKGARCH_TOOLS}-${MONGODB_TOOLS_VERSION}.deb && \
    rm mongodb-mongosh_${MONGODB_SHELL_VERSION}_${DPKGARCH_SHELL}.deb && \
    rm -rf /var/lib/apt/lists/*

USER nobody
