---
layout: sub-navigation.njk
order: 18
title: Deployments
description: Releasing DECS into environments
---

[[toc]]

## Introduction
Services are packaged as [Helm](https://helm.sh/) packages, defined in [helmfile specs](https://github.com/helmfile/helmfile) and releases through to environments are orchestrated through [Kubernetes](https://kubernetes.io/).

Releases to environments are controlled and triggered via deployment repositories in GitHub. There are separate repositories for [notprod 🔒](https://github.com/UKHomeOffice/hocs-deployments-notprod) and [prod 🔒](https://github.com/UKHomeOffice/hocs-deployments-prod) environments. The repositories hold release configuration for multiple environments. 

Additional deployment repositories can be created if required by forking the [base deployment template](https://github.com/UKHomeOffice/hocs-deployments-base).

> The rest of this guide will use the deployment template as an example deployment repository. In a real change scenario, the changes would be committed against the relevant deployment repository.

## Create a Release
To create a Release, a PR is created in the deployment repository with the changes to be released into the environment.

When the PR is approved and merged, the merge to `main` triggers a release to the environment.

### Release new versions of services
If the changes are new versions of services to be deployed, the [versions file](https://github.com/UKHomeOffice/hocs-deployments-base/blob/main/environments/example/versions.yaml) is updated with the required versions and services.

### Add/Remove a Deployment
Deployment defaults are held in the [base file](https://github.com/UKHomeOffice/hocs-deployments-base/blob/main/charts.yaml).

To add or remove a Deployment in a specific environment, update the [charts](https://github.com/UKHomeOffice/hocs-deployments-base/blob/main/environments/example/charts.yaml.gotmpl) file in the environment directory.

## Deployment pipeline
The Drone pipeline configuration is defined in the [`.drone` file](https://github.com/UKHomeOffice/hocs-deployments-base/blob/main/environments/example/.drone.yml).

The drone file runs the [helmfile](https://github.com/UKHomeOffice/hocs-deployments-base/blob/main/helmfile-deploy.sh) deploy script.
