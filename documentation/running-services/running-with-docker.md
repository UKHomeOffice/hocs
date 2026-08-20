---
layout: sub-navigation.njk
order: 2
title: Running services with Docker
---
[[toc]]

## Docker Compose for local development


The [hocs](https://github.com/UKHomeOffice/hocs) repository contains a [Docker Compose](https://docs.docker.com/compose/) 
file in `hocs/ci/docker-compose.yml`.

### Pull all services
From the project root run:
```console
$ docker compose -f ./ci/docker-compose.yml -f ./ci/docker-compose.elastic.yml pull
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
$ docker compose -f ./ci/docker-compose.yml up -d frontend
```

>With Docker using 4 GB of memory, this takes approximately 2 minutes to startup.

### Start typical services and the frontend including search
From the project root run:
```console
$ docker compose -f ./ci/docker-compose.yml -f ./ci/docker-compose.elastic.yml up -d frontend
```

>Docker will need more than 4 GB of memory, or for developing against elasticsearch just start localstack:

### Start typical services and the frontend via the local auth proxy
If you want the local proxy to inject the hosted-style `X-Auth-*` headers,
first copy the tracked template to `ci/.env`, then add your own user ID,
roles, and groups:

```console
$ cp ./ci/.env.example ./ci/.env
```

Then from the project root run:

```console
$ docker compose -f ./ci/docker-compose.yml up -d frontend-proxy
```

Then open the app at `http://localhost:8094`.

The `frontend-proxy` service sits in front of `frontend`, injects the same
`X-Auth-*` headers that were previously supplied with ModHeader, and forwards
requests to the frontend container.

### Start typical services and the frontend via the local auth proxy including search
Set up `ci/.env` first as above, then run:

```console
$ docker compose -f ./ci/docker-compose.yml -f ./ci/docker-compose.elastic.yml up -d frontend-proxy
```

### Start typical services and the management ui via the local auth proxy
The management UI proxy uses the same `ci/.env` header values as
`frontend-proxy`.

From the project root run:

```console
$ docker compose -f ./ci/docker-compose.yml up -d management-ui-proxy
```

Then open the app at `http://localhost:8095`.

### Start typical services and the management ui via the local auth proxy including search
Set up `ci/.env` first as above, then run:

```console
$ docker compose -f ./ci/docker-compose.yml -f ./ci/docker-compose.elastic.yml up -d management-ui-proxy
```

### Start localstack (sqs, sns, s3)
From the project root run:
```console
$ docker compose -f ./ci/docker-compose.yml up -d localstack
```
>With Docker using 4 GB of memory, this takes approximately 2 minutes to startup.

### Start localstack (sqs, sns, s3, es)
From the project root run:
```console
$ docker compose -f ./ci/docker-compose.yml -f ./ci/docker-compose.elastic.yml up -d localstack
```

>With Docker using 4 GB of memory, this takes approximately 5 minutes to startup.


### Stop the services
From the project root run:
```console
$ docker compose -f ./ci/docker-compose.yml -f ./ci/docker-compose.elastic.yml stop
```
> This will retain data in the local database and other volumes.

### Stop and remove containers, networks, images, and volumes,
From the project root run:
```console
$ docker compose -f ./ci/docker-compose.yml -f ./ci/docker-compose.elastic.yml rm -vfs
```
> This will remove the local database and all data.

### Start individual services without any dependencies
From the project root run:
```console
$ docker compose -f ./ci/docker-compose.yml up --no-deps casework
```

### Use of `ci/.env`
The Docker Compose file uses variables for image tags and the frontend proxy
headers. Because the Compose file lives under `ci/`, Docker Compose will load
`ci/.env` by default.

You can start from the tracked template file:

```console
$ cp ./ci/.env.example ./ci/.env
```

By default, `latest` will be used for image tags. The following is an example
of a `ci/.env` file overriding some services:
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

### Override proxy header values
Keep the local proxy header values in `ci/.env`. The Compose file also lives
under `ci/`, so Docker Compose will load `ci/.env` by default when you run the
proxy commands shown above.

For example, create a local uncommitted `ci/.env` containing:

```shell
FRONTEND_PROXY_AUTH_USERNAME=my-user
FRONTEND_PROXY_AUTH_USER_ID=04167856-f772-4bca-87b9-f8b6739853b7
FRONTEND_PROXY_AUTH_TOKEN=1234456
FRONTEND_PROXY_AUTH_GROUPS=/some-group,/another-group
FRONTEND_PROXY_AUTH_ROLES=MANAGEMENT_UI
```

Then use one of the earlier `frontend-proxy` startup examples, depending on
whether you also want search enabled.

If you change `ci/.env` after the proxy is already running, restart or recreate
`frontend-proxy` so the new header values are applied.

If you prefer, you can still provide the same values via exported shell
variables instead of `ci/.env`.

Supported overrides are:

* `FRONTEND_PROXY_AUTH_USER_ID`
* `FRONTEND_PROXY_AUTH_TOKEN`
* `FRONTEND_PROXY_AUTH_GROUPS`
* `FRONTEND_PROXY_AUTH_USERNAME`
* `FRONTEND_PROXY_AUTH_ROLES`

`X-Auth-Subject` is automatically populated from `FRONTEND_PROXY_AUTH_USER_ID`.
