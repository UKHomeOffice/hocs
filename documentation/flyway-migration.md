---
layout: sub-navigation
order: 4
title: Flyway data migration
---

The info-service doesn't come with its schema. To load the schema it relies on a data_migration step in the docker-compose file.

The data_migration step loads the info schema using [flyway](https://flywaydb.org/) scripts.

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
