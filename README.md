# Mongodb Utility Docker image

This image is based on the official mongodb tools image and adds the following tools:

+ mongodb-shell
+ mongodb-database-tools

## Usage

Refer to: https://hub.docker.com/r/bushwhackr/mongodb-utils

```shell
docker run --rm -it bushwhackr/mongodb-utility:latest bash

mongosh "<connection string>"
mongodump --uri="<connection string>" --archive --gzip --db=<database> --collection=<collection>
```
