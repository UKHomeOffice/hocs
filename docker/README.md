# docker-compose

This directory contains configuration for Docker Compose, a quick way to get a
local HOCS environment on your computer. 

If this is the first time you run it, Compose will download the latest images; this could
take fifteen minutes, depending on your connection. To relieve pressure on your machine's resources, 
it is better to pull the images first then run up the app 

To pull all services, from the project directory run:
```console
$ docker-compose -f ./docker/docker-compose.yml pull
```

To start 'typical' services and the frontend, from the project root run:
```console
$ docker-compose -f ./docker/docker-compose.yml up -d frontend 
```

With Docker using 4 GB of memory, this takes approximately 2 minutes to startup.

To start with 'typical' + search and the frontend, from the project root run:
```console
$ docker-compose -f ./docker/docker-compose.yml -f ./docker/docker-compose.elastic.yml up -d frontend 
```

Docker will need more than 4 GB of memory, or for developing against elasticsearch just start localstack:

```console
$ docker-compose -f ./docker/docker-compose.yml -f ./docker/docker-compose.elastic.yml up -d localstack 
```

With Docker using 4 GB of memory, this takes approximately 2 minutes to startup.

To turn the containers off, from the project root run:
```console
$ docker-compose -f ./docker/docker-compose.yml stop
```
> Note this will retain data in the local database and other volumes.

If you wish to Stop and remove containers, networks, images, and volumes,
from the project root run:
```console
$ docker-compose -f ./docker/docker-compose.yml rm -vfs
```
> Note this will remove the local database and all data.

To only run the infrastructure containers (like PostgreSQL, AWS and ClamAV),
or to run the other HOCS services that aren't frontend, from the project root run:
```console
$ ./docker/scripts/infrastructure.sh
$ ./docker/scripts/services.sh
```

You can also run individual services. From the project root run:
```console
$ docker-compose -f ./docker/docker-compose.yml up frontend
```

If Docker doesn't have the images it needs, it will automatically
pull them. However, it won't pull existing images. If you want to run
the latest versions of services, remember to ask for them first:

```console
$ docker-compose -f ./docker/docker-compose.yml pull
```

## Use of .env file
The docker-compose file has variables for the image tags. This allows the use of a ``.env`` file.
By default, ``latest`` will be used. The following is an example of a file overriding some services:
```shell
FRONTEND_TAG=branch-epic_HOCS-COMP
CASEWORK_TAG=branch-epic_HOCS-COMP
WORKFLOW_TAG=branch-epic_HOCS-COMP
CASE_CREATOR_TAG=branch-epic_HOCS-COMP
INFO_TAG=branch-epic_HOCS-COMP
HOCS_DATA_TAG=branch-feature_HOCS-2907-compose-up-all
HOCS_DATA_REPO=hocs-data
HOCS_DATA_ELASTIC_REPO=hocs-data-elastic
```
The `HOCS_DATA_REPO` can be one of:
* hocs-data
* hocs-data-wcs

The `HOCS_DATA_ELASTIC_REPO` can be one of:
* hocs-data-elastic
* hocs-data-wcs-elastic

## Data migration

The info-service doesn't come with its schema. To load the schema it relies on a data_migration step in the docker-compose file.

The data_migration step loads the info schema using flyway scripts.

To select hocs-data or hocs-data-wcs set the variable ``HOCS_DATA_REPO`` in your ``.env`` file to either:
* hocs-data (default)
* hocs-data-wcs

The docker image for the data is stored in AWS ECR, to pull it you will need to set up
an AWS profile and then run one of the following (depending on your AWS CLI version):

AWS-CLI v1.*
```console
$ $(aws ecr get-login --no-include-email --profile acp-ecr)
```

AWS-CLI v2.*
```console
aws ecr get-login-password --region eu-west-2 | docker login --username AWS --password-stdin 340268328991.dkr.ecr.eu-west-2.amazonaws.com
```

To be able to pull the image you need to be in authorised to do so.
This is in the ACP Hub in the Docker repos section.

AWS credentials are stored in the ACP hub, under your "Connected Identities" section.


## Troubleshooting
### 403 on Frontend

The frontend container doesn't handle authentication, as it is handled
by a proxy before it hits the app. You'll need to set authentication
headers yourself using (for example) a browser extension. Ask an existing
developer for their copy. This might manifest itself as a browser timeout:
check stderr before assuming something else is wrong.
