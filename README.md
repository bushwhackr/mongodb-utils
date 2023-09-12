# Mongodb Utility Docker image

This image is based on the official mongodb tools image and adds the following tools:

+ mongodb-shell
+ mongodb-database-tools
+ mc (minio client)

## Usage

Refer to: https://hub.docker.com/r/bushwhackr/mongodb-utils

```shell
docker run --rm -it bushwhackr/mongodb-utility:latest bash

# Mongodb Connection
mongosh "<connection string>"

# Mongodb Backup
mongodump --uri="<connection string>" --archive --gzip --db=<database> --collection=<collection>

# S3 (minio mc) Upload
mc alias gcp https://storage.googleapis.com <access key> <secret key>
mc cp <file> gcp/<bucket>/<path>


# S3 (minio mc) Download
mc alias gcp https://storage.googleapis.com <access key> <secret key>
mc cp gcp/<bucket>/<path> <file>

# Mongodb Restore
mongorestore --uri="<connection string>" --archive --gzip --db=<database> --collection=<collection>
```
