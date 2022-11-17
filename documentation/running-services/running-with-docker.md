---
layout: sub-navigation
order: 2
title: Running services with Docker
---

## Docker Compose for local development

The [hocs](https://github.com/UKHomeOffice/hocs) repository contains a [Docker Compose](https://docs.docker.com/compose/) file in `hocs/docker/docker-compose.yml`.

### Pull all services
From the project root run:
```console
$ docker-compose -f ./ci/docker-compose.yml pull
```

The docker image for the data is stored in AWS ECR, to pull it you will need to set up
an AWS profile and then run one of the following (depending on your AWS CLI version):

AWS-CLI v1.*
```console
$ $(aws ecr get-login --no-include-email --profile acp-ecr)
```

AWS-CLI v2.*
```console
$ aws ecr get-login-password --region eu-west-2 | docker login --username AWS --password-stdin 340268328991.dkr.ecr.eu-west-2.amazonaws.com
```

To be able to pull the image you need to be in authorised to do so.
This is in the ACP Hub in the Docker repos section.

AWS credentials are stored in the ACP hub, under your "Connected Identities" section.

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
$ docker-compose -f ./ci/docker-compose.yml ./ci/docker-compose.elastic.yml stop
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
