# DECS

**HOCS**, known in business contexts as **DECS**,
is a tracking and routing tool that &ldquo;allows Home Office teams to
control and audit the flow of all correspondence through its
life-cycle from receipt to final response&rdquo;.

DECS is mostly written in Java, using the [Spring Boot](https://spring.io/projects/spring-boot)
library. Frontend components are written using JavaScript, often React.

Most development for DECS is open-source, but coded by developers who work at
or for the Home Office.

## Getting the code

Almost all HOCS code is open-source and publicly available on GitHub.

### Core components
[hocs-audit](https://github.com/UKHomeOffice/hocs-audit)

[hocs-extracts](https://github.com/UKHomeOffice/hocs-extracts)

[hocs-case-creator](https://github.com/UKHomeOffice/hocs-case-creator)

[hocs-casework](https://github.com/UKHomeOffice/hocs-casework)

[hocs-data 🔒️ *(to be deprecated)*](https://github.com/UKHomeOffice/hocs-data)

[hocs-data-wcs 🔒️ *(to be deprecated)*](https://github.com/UKHomeOffice/hocs-data-wcs)

[hocs-docs](https://github.com/UKHomeOffice/hocs-docs)

[hocs-docs-converter](https://github.com/UKHomeOffice/hocs-docs-converter)

[hocs-info-service](https://github.com/UKHomeOffice/hocs-info-service)

[hocs-notify](https://github.com/UKHomeOffice/hocs-notify)

[hocs-search](https://github.com/UKHomeOffice/hocs-search)

[hocs-templates](https://github.com/UKHomeOffice/hocs-templates)

[hocs-workflow](https://github.com/UKHomeOffice/hocs-workflow)

## UI components
[hocs-frontend](https://github.com/UKHomeOffice/hocs-frontend)

[hocs-management-ui](https://github.com/UKHomeOffice/hocs-management-ui)

## Utility components
[hocs-toolbox](https://github.com/UKHomeOffice/hocs-toolbox)

[hocs-queue-tool](https://github.com/UKHomeOffice/hocs-queue-tool)

### Infrastructure
[hocs-base-image](https://github.com/UKHomeOffice/hocs-base-image)

[hocs-ci-infrastructure](https://github.com/UKHomeOffice/hocs-ci-infrastructure)

[match-label-action](https://github.com/UKHomeOffice/match-label-action)

[semver-calculate-action](https://github.com/UKHomeOffice/semver-calculate-action)

[semver-tag-action](https://github.com/UKHomeOffice/semver-tag-action)

[view open pull requests shortcut](https://github.com/pulls?q=is%3Aopen+repo%3AUKHomeOffice%2Fhocs-ci-infrastructure+repo%3AUKHomeOffice%2Fsemver-calculate-action+repo%3AUKHomeOffice%2Fhocs-extracts+repo%3AUKHomeOffice%2Fhocs-toolbox+repo%3AUKHomeOffice%2Fhocs-audit+repo%3AUKHomeOffice%2Fhocs-case-creator+repo%3AUKHomeOffice%2Fhocs-casework+repo%3AUKHomeOffice%2Fhocs-docs+repo%3AUKHomeOffice%2Fhocs-docs-converter+repo%3AUKHomeOffice%2Fhocs-info-service+repo%3AUKHomeOffice%2Fkube-hocs+repo%3AUKHomeOffice%2Fhocs-search+repo%3AUKHomeOffice%2Fhocs-management-ui+repo%3AUKHomeOffice%2Fhocs-templates+repo%3AUKHomeOffice%2Fhocs-notify+repo%3AUKHomeOffice%2Fhocs-workflow+repo%3AUKHomeOffice%2Fhocs-frontend+repo%3AUKHomeOffice%2Fhocs-base-image+repo%3AUKHomeOffice%2Fhocs+repo%3AUKHomeOffice%2Fhocs-ukvi-complaint-schema+repo%3AUKHomeOffice%2Fhocs-data+repo%3AUKHomeOffice%2Fhocs-data-wcs+repo%3AUKHomeOffice%2Fhocs-queue-tool+repo%3AUKHomeOffice%2Fmatch-label-action+repo%3AUKHomeOffice%2Fsemver-tag-action+)





## Submodules

This project contains a 'ci' submodule with a docker-compose and infrastructure scripts in it. 
Most modern IDEs will handle pulling this automatically for you, but if not

```console
$ git submodule update --init --recursive
```

## Docker Compose

This repository contains a [Docker Compose](https://docs.docker.com/compose/)
file.

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
