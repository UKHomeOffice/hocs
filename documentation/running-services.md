---
layout: sub-navigation.njk
order: 7
title: Running services for development
description: Running services locally via an IDE and running services with Docker.
---

[[toc]]

## Local infrastructure configuration
Whether the services are being run through Docker or via an IDE, there are core infrastructure elements which will need to be spun up via Docker, such as [localstack](https://github.com/localstack/localstack) and [keycloak](https://github.com/keycloak/keycloak).

Configuration for CI pipelines is defined in [`hocs-ci-infrastructure`](https://github.com/UKHomeOffice/hocs-ci-infrastructure), as a side effect this configuration makes a docker-compose configuration available for local development.

### Localstack configuration
Configuration for Localstack is also defined in [`hocs-ci-infrastructure`](https://github.com/UKHomeOffice/hocs-ci-infrastructure/tree/main/localstack).

The configuration includes the setup of:
- [S3 Buckets](https://github.com/UKHomeOffice/hocs-ci-infrastructure/blob/main/localstack/1-setup-buckets.sh)
- [SQS Queues and Dead Letter Queues](https://github.com/UKHomeOffice/hocs-ci-infrastructure/blob/main/localstack/2-setup-queues.sh)
- [ElasticSearch](https://github.com/UKHomeOffice/hocs-ci-infrastructure/blob/main/localstack/3-setup-elastic.sh)
- [ElasticSearch indexes](https://github.com/UKHomeOffice/hocs-ci-infrastructure/blob/main/localstack/4-setup_index.sh)
