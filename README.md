# DECS

**HOCS**, known in business contexts as **DECS**,
is a tracking and routing tool that &ldquo;allows Home Office teams to
control and audit the flow of all correspondence through its
life-cycle from receipt to final response&rdquo;.

DECS is mostly written in Java, using the [Spring Boot](https://spring.io/projects/spring-boot)
library. Frontend components are written using JavaScript, often React.

Most development for DECS is open-source, but coded by developers who work at
or for the Home Office.

* **Development discussion** happens primarily on the [internal Home Office Digital slack
  instance](https://homeofficedigital.slack.com), in `#decs-dev`
  channels, with secondary discussions happening between developers using a
  video-conferencing tool.
* **Source code** is managed by the Git revision control system, with code
  hosted on GitHub.
* **Bug reports** are managed via the Home Office's self-hosted instance of Jira.
* **Code review** is managed using GitHub's merge request functionality.

## Getting the code

Almost all HOCS code is open-source and publicly available on GitHub.
Some rarely used legacy code is stored in the Home Office's own GitLab instance.

All HOCS code on GitHub is hosted within the UKHomeOffice organisation.
You can [search the organisation](https://github.com/UKHomeOffice/?q=hocs) for
a list of our repositories. Some repositories are archived, and no longer in use.

Some parts of the HOCS codebase are not publicly available.
This includes the schema used to set up the info-service.

## Docker Compose

This repository contains a [Docker Compose](https://docs.docker.com/compose/)
configuration.

To pull all services, from the project directory run:
```console
$ docker-compose -f ./ci/docker-compose.yml pull
```

To start 'typical' services and the frontend, from the project root run:
```console
$ docker-compose -f ./ci/docker-compose.yml up -d frontend 
```

With Docker using 4 GB of memory, this takes approximately 2 minutes to startup.

To start with 'typical' + search and the frontend, from the project root run:
```console
$ docker-compose -f ./ci/docker-compose.yml -f ./ci/docker-compose.elastic.yml up -d frontend 
```

Docker will need more than 4 GB of memory, or for developing against elasticsearch just start localstack:

```console
$ docker-compose -f ./ci/docker-compose.yml -f ./ci/docker-compose.elastic.yml up -d localstack 
```

With Docker using 4 GB of memory, this takes approximately 2 minutes to startup.

To turn the containers off, from the project root run:
```console
$ docker-compose -f ./ci/docker-compose.yml stop
```
> Note this will retain data in the local database and other volumes.

If you wish to Stop and remove containers, networks, images, and volumes,
from the project root run:
```console
$ docker-compose -f ./ci/docker-compose.yml rm -vfs
```
> Note this will remove the local database and all data.

To only run the infrastructure containers (like PostgreSQL, AWS and ClamAV),
or to run the other HOCS services that aren't frontend, from the project root run:
```console
$ ./infrastructure.sh
$ ./services.sh
```

You can also run individual services. From the project root run:
```console
$ docker-compose -f ./ci/docker-compose.yml up frontend
```

### Use of .env file
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

### Data migration

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
$ aws ecr get-login-password --region eu-west-2 | docker login --username AWS --password-stdin 340268328991.dkr.ecr.eu-west-2.amazonaws.com
```

To be able to pull the image you need to be in authorised to do so.
This is in the ACP Hub in the Docker repos section.

AWS credentials are stored in the ACP hub, under your "Connected Identities" section.

### Troubleshooting
#### 403 on Frontend

The frontend container doesn't handle authentication, as it is handled
by a proxy before it hits the app. You'll need to set authentication
headers yourself using (for example) a browser extension. Ask an existing
developer for their copy. This might manifest itself as a browser timeout:
check stderr before assuming something else is wrong.
