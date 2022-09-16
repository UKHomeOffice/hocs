---
layout: sub-navigation
order: 6
title: Running services with Docker
---

## Docker Compose

The [hocs](https://github.com/UKHomeOffice/hocs) repository contains a [Docker Compose](https://docs.docker.com/compose/) file.

### Pull all services
From the project root run:
```console
$ docker-compose -f ./ci/docker-compose.yml pull
```

### Start typical services and the frontend
From the project root run:
```console
$ docker-compose -f ./ci/docker-compose.yml up -d frontend 
```

>With Docker using 4 GB of memory, this takes approximately 2 minutes to startup.

### Start typical service and the frontend including search
From the project root run:
```console
$ docker-compose -f ./ci/docker-compose.yml -f ./ci/docker-compose.elastic.yml up -d frontend 
```

>Docker will need more than 4 GB of memory, or for developing against elasticsearch just start localstack:

### Start localstack (sqs, sns, s3)
From the project root run:
```console
$ docker-compose -f ./ci/docker-compose.yml -d localstack 
```
>With Docker using 4 GB of memory, this takes approximately 2 minutes to startup.

### Start localstack (sqs, sns, s3, es)
From the project root run:
```console
$ docker-compose -f ./ci/docker-compose.yml -f ./ci/docker-compose.elastic.yml up -d localstack 
```

>With Docker using 4 GB of memory, this takes approximately 5 minutes to startup.


### Stop the services
From the project root run:
```console
$ docker-compose -f ./ci/docker-compose.yml stop
```
> This will retain data in the local database and other volumes.

### Stop and remove containers, networks, images, and volumes,
From the project root run:
```console
$ docker-compose -f ./ci/docker-compose.yml rm -vfs
```
> This will remove the local database and all data.

### Start individual services without any dependencies
From the project root run:
```console
$ docker-compose -f ./ci/docker-compose.yml up --no-deps casework 
```

### Use of .env file
The docker-compose file has variables for the image tags. This allows the use of a ``.env`` file.
By default, ``latest`` will be used. The following is an example of a file overriding some services:
```shell
FRONTEND_TAG=1.2.3
CASEWORK_TAG=1.0.25
WORKFLOW_TAG=latest
CASE_CREATOR_TAG=1.2.4
INFO_TAG=f99d9a7573e93f1c664ce11e0189764a688dbee4
HOCS_DATA_TAG=1.0.0
HOCS_DATA_REPO=hocs-data
```
The `HOCS_DATA_REPO` can be one of:
* hocs-data
* hocs-data-wcs
