---
layout: sub-navigation
order: 3
title: Code repositories
---

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

### UI components
[hocs-frontend](https://github.com/UKHomeOffice/hocs-frontend)

[hocs-management-ui](https://github.com/UKHomeOffice/hocs-management-ui)

### Utility components
[hocs-toolbox](https://github.com/UKHomeOffice/hocs-toolbox)

[hocs-queue-tool](https://github.com/UKHomeOffice/hocs-queue-tool)

### Infrastructure
[hocs-base-image](https://github.com/UKHomeOffice/hocs-base-image)

[hocs-ci-infrastructure](https://github.com/UKHomeOffice/hocs-ci-infrastructure)

[kube-hocs 🔒️](https://github.com/UKHomeOffice/kube-hocs)

[hocs-github-actions](https://github.com/UKHomeOffice/hocs-github-actions)

[match-label-action](https://github.com/UKHomeOffice/match-label-action)

[semver-calculate-action](https://github.com/UKHomeOffice/semver-calculate-action)

[semver-tag-action](https://github.com/UKHomeOffice/semver-tag-action)

### Schemas
[hocs-ukvi-complaint-schema](https://github.com/UKHomeOffice/hocs-ukvi-complaint-schema)

[hocs-migration-schema](https://github.com/UKHomeOffice/hocs-migration-schema)

## Submodules

This project contains a 'ci' submodule with a docker-compose and infrastructure scripts in it.

Most modern IDEs will handle pulling this automatically for you, but if not, run:

```console
$ git submodule update --init --recursive
```