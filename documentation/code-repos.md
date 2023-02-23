---
layout: sub-navigation.njk
order: 4
title: Code repositories
---
[[toc]]

## Getting the code

Almost all HOCS code is open-source and publicly available on GitHub. This page lists the GitHub repos and a [GitHub PR filter](#github-pull-request-filter).

### Core components
[hocs-audit](https://github.com/UKHomeOffice/hocs-audit)
Receives audit event messages from an SQS queue for persistent storage.

[hocs-case-creator](https://github.com/UKHomeOffice/hocs-case-creator)
Reads a message containing a JSON payload from an AWS SQS Queue, and creates a cases with associated data.

[hocs-casework](https://github.com/UKHomeOffice/hocs-casework)
Handles interactions with reference data specific to cases.

[hocs-data 🔒️ *(to be deprecated)*](https://github.com/UKHomeOffice/hocs-data)
The CS schema.

[hocs-data-wcs 🔒️ *(to be deprecated)*](https://github.com/UKHomeOffice/hocs-data-wcs)
The WCS schema.

[hocs-docs](https://github.com/UKHomeOffice/hocs-docs)
Handles interactions with documents stored in S3, document conversion, and virus scanning.

[hocs-docs-converter](https://github.com/UKHomeOffice/hocs-docs-converter)
Accepts any document as a parameter and returns a `.pdf` document.

[hocs-info-service](https://github.com/UKHomeOffice/hocs-info-service)
Handles various reference data interactions.

[hocs-notify](https://github.com/UKHomeOffice/hocs-notify)
Sends emails to users based on system events.

[hocs-outbound-proxy](https://github.com/UKHomeOffice/hocs-outbound-proxy)
A transparent proxy using Squid, to be used in conjunction with kubernetes network policies, traffic is limited to whitelisted domains.

[hocs-search](https://github.com/UKHomeOffice/hocs-search)
Serves the search functionality through the use of `elasticsearch` /  `opensearch`.

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
[hocs](https://github.com/UKHomeOffice/hocs)
Contains documentation (this site) and bash scripts. Launch services locally via Docker Compose from `hocs` repo.

[hocs-casework-search-indexer](https://github.com/UKHomeOffice/hocs-casework-search-indexer)
Reindexs all data in hocs-casework to the hocs-search `elasticsearch` index.

[hocs-toolbox](https://github.com/UKHomeOffice/hocs-toolbox)
Tools to interact with an environment's databases.

[hocs-queue-tool](https://github.com/UKHomeOffice/hocs-queue-tool)
A utility to manage and purge queues - both SQS and DLQ.

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

[sas-github-workflows](https://github.com/UKHomeOffice/sas-github-workflows)
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


## GitHub Pull Request filter
See all PRs with a [GitHub PR filter](https://github.com/pulls?q=is%3Aopen+repo%3AUKHomeOffice%2Fhocs+repo%3AUKHomeOffice%2Fhocs-audit+repo%3AUKHomeOffice%2Fhocs-case-creator+repo%3AUKHomeOffice%2Fhocs-casework+repo%3AUKHomeOffice%2Fhocs-data+repo%3AUKHomeOffice%2Fhocs-data-wcs+repo%3AUKHomeOffice%2Fhocs-docs+repo%3AUKHomeOffice%2Fhocs-docs-converter+repo%3AUKHomeOffice%2Fhocs-info-service+repo%3AUKHomeOffice%2Fhocs-notify+repo%3AUKHomeOffice%2Fhocs-search+repo%3AUKHomeOffice%2Fhocs-templates+repo%3AUKHomeOffice%2Fhocs-workflow+repo%3AUKHomeOffice%2Fhocs-frontend+repo%3AUKHomeOffice%2Fhocs-management-ui+repo%3AUKHomeOffice%2Fhocs-casework-search-indexer+repo%3AUKHomeOffice%2Fhocs-toolbox+repo%3AUKHomeOffice%2Fhocs-queue-tool+repo%3AUKHomeOffice%2Fhocs-deployments-notprod+repo%3AUKHomeOffice%2Fhocs-deployments-prod+repo%3AUKHomeOffice%2Fhocs-deployments-base+repo%3AUKHomeOffice%2Fhocs-base-image+repo%3AUKHomeOffice%2Fhocs-ci-infrastructure+repo%3AUKHomeOffice%2Fsas-github-workflows+repo%3AUKHomeOffice%2Fhocs-helm-charts+repo%3AUKHomeOffice%2Fhocs-helm-kubectl+repo%3AUKHomeOffice%2Fmatch-label-action+repo%3AUKHomeOffice%2Fsemver-calculate-action+repo%3AUKHomeOffice%2Fsemver-tag-action+repo%3AUKHomeOffice%2Fupdate-helmfile-action+repo%3AUKHomeOffice%2Fhocs-ukvi-complaint-schema+repo%3AUKHomeOffice%2Fhocs-migration-schema). The filter has the rule:
```
is:open
repo:UKHomeOffice/hocs
repo:UKHomeOffice/hocs-audit
repo:UKHomeOffice/hocs-case-creator
repo:UKHomeOffice/hocs-casework
repo:UKHomeOffice/hocs-data
repo:UKHomeOffice/hocs-data-wcs
repo:UKHomeOffice/hocs-docs
repo:UKHomeOffice/hocs-docs-converter
repo:UKHomeOffice/hocs-info-service
repo:UKHomeOffice/hocs-notify
repo:UKHomeOffice/hocs-search
repo:UKHomeOffice/hocs-templates
repo:UKHomeOffice/hocs-workflow
repo:UKHomeOffice/hocs-frontend
repo:UKHomeOffice/hocs-management-ui
repo:UKHomeOffice/hocs-casework-search-indexer
repo:UKHomeOffice/hocs-toolbox
repo:UKHomeOffice/hocs-queue-tool
repo:UKHomeOffice/hocs-deployments-notprod
repo:UKHomeOffice/hocs-deployments-prod
repo:UKHomeOffice/hocs-deployments-base
repo:UKHomeOffice/hocs-base-image
repo:UKHomeOffice/hocs-ci-infrastructure
repo:UKHomeOffice/sas-github-workflows
repo:UKHomeOffice/hocs-helm-charts
repo:UKHomeOffice/hocs-helm-kubectl
repo:UKHomeOffice/match-label-action
repo:UKHomeOffice/semver-calculate-action
repo:UKHomeOffice/semver-tag-action
repo:UKHomeOffice/update-helmfile-action
repo:UKHomeOffice/hocs-ukvi-complaint-schema
repo:UKHomeOffice/hocs-migration-schema
```
