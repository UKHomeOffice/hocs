---
layout: sub-navigation.njk
order: 6
title: Flyway data migration
---

This documentation covers:

- How to load the info schema.
- How to load the workflow schema.
- How to create a flyway patch.

## Info schema

### Local migrations
The info schema is managed by flyway inside hocs-data (for CS) and hocs-data-wcs (for WCS), therefore to run the scripts for either project run a dockerised flyway locally by executing the following in the data project root:

```
./scripts/migrate-local.sh
```

### Using docker-compose

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

## Workflow schema
The workflow schema should be created when the Postgres image starts with a clean volume before running the hocs-workflow project.

If the schema isn't created then create it manually:

```
create schema workflow
```

## Creating a data patch

> **Warning**
> For this process, never modify an existing data patch file, as this will cause the flyway mechanism to fail.

1. Create a new file inside the relevant directory in the data repo, with the naming convention V1_{version increment}__{ticket number}_{brief description}
e.g. `V1_123__1234_MyNewDataPatch.sql`
2. Add SQL statements as required
3. To test/run the new patch locally run the `./scripts/migrate-local.sh` command from the data repo.
