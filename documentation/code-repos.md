---
layout: sub-navigation
order: 4
title: Code repositories
---

## Getting the code

Almost all HOCS code is open-source and publicly available on GitHub.

### Core components
[hocs-audit](https://github.com/UKHomeOffice/hocs-audit)
Receives audit event messages from an SQS queue for persistent storage.

[hocs-case-creator](https://github.com/UKHomeOffice/hocs-case-creator)
Reads a message containing a JSON payload from an AWS SQS Queue, and creates a cases with associateed data.

[hocs-casework](https://github.com/UKHomeOffice/hocs-casework)
Handles interactions with reference data specific to cases.

[hocs-data 🔒️ *(to be deprecated)*](https://github.com/UKHomeOffice/hocs-data)
The CS schema.

[hocs-data-wcs 🔒️ *(to be deprecated)*](https://github.com/UKHomeOffice/hocs-data-wcs)
The WCS schema.

[hocs-docs](https://github.com/UKHomeOffice/hocs-docs)
Handles interactions with documents stored in S3.

[hocs-docs-converter](https://github.com/UKHomeOffice/hocs-docs-converter)
Accepts any document as a parameter and returns a `.pdf` document.

[hocs-info-service](https://github.com/UKHomeOffice/hocs-info-service)
Handles various reference data interactions.

[hocs-notify](https://github.com/UKHomeOffice/hocs-notify)
Sends emails to users based on system events.

[hocs-search](https://github.com/UKHomeOffice/hocs-search)
Serves the search functionality through the use of `elasticsearch`.

[hocs-templates](https://github.com/UKHomeOffice/hocs-templates)
Handles templates stored in S3 for use within caseworking functions.

[hocs-workflow](https://github.com/UKHomeOffice/hocs-workflow)
Handles interactions with the workflow engine, powered by [Camunda](https://camunda.com/platform-7/workflow-engine/). 

### UI components
[hocs-frontend](https://github.com/UKHomeOffice/hocs-frontend)
[React](https://reactjs.org/) application and [NodeJS](https://nodejs.org/en/) Server for server rendered dynamic forms.

[hocs-management-ui](https://github.com/UKHomeOffice/hocs-management-ui)
[React](https://reactjs.org/) application for performing management utility functions.

### Utility components
[hocs-casework-search-indexer](https://github.com/UKHomeOffice/hocs-casework-search-indexer)
Reindexs all data in hocs-casework to the hocs-search `elasticsearch index.

[hocs-toolbox](https://github.com/UKHomeOffice/hocs-toolbox)
Tools to interact with an environment's databases and AWS resources.

[hocs-queue-tool](https://github.com/UKHomeOffice/hocs-queue-tool)
A utility to investigate and manage Dead Letter Queues.

### Deployment repos ###

[hocs-deployments-notprod 🔒](https://github.com/UKHomeOffice/hocs-deployments-notprod)
Controls deployments to notprod environments.

[hocs-deployments-prod 🔒](https://github.com/UKHomeOffice/hocs-deployments-prod)
Controls deployments to prod environments.

[hocs-deployments-base](https://github.com/UKHomeOffice/hocs-deployments-base)
A base for deployment helmfile projects.

### Infrastructure
[hocs-base-image](https://github.com/UKHomeOffice/hocs-base-image)
Minimal docker image for JVM based DECS services.

[hocs-ci-infrastructure](https://github.com/UKHomeOffice/hocs-ci-infrastructure)
Referenced by other repos to provide centrally configured, consistent and reusable CI pipeline components.

[hocs-github-actions](https://github.com/UKHomeOffice/hocs-github-actions)
Contains a set of centrally configured, consistent and reusable CI pipeline components.

[hocs-helm-charts](https://github.com/UKHomeOffice/hocs-helm-charts)
Common place for helm charts used by the HOCS service.

[hocs-helm-kubectl](https://github.com/UKHomeOffice/hocs-helm-kubectl)
Docker image for CI/CD pipelines on DECS.

[match-label-action](https://github.com/UKHomeOffice/match-label-action)
Action that fails a GitHub job if specified labels are not present within Pull Requests.

[semver-calculate-action](https://github.com/UKHomeOffice/semver-calculate-action)
Action that identifies the latest SemVer tag and increments it.

[semver-tag-action](https://github.com/UKHomeOffice/semver-tag-action)
Action that tags a commit with a valid SemVer tag.

[update-helmfile-action](https://github.com/UKHomeOffice/update-helmfile-action)
Action to update a version yaml file with the latest tagged semantic version of the repository.

### Schemas
[hocs-ukvi-complaint-schema](https://github.com/UKHomeOffice/hocs-ukvi-complaint-schema)
The JSON schema for the UKVI Complaints Management complaint schema.

[hocs-migration-schema](https://github.com/UKHomeOffice/hocs-migration-schema)
The JSON schema for the case migration.
