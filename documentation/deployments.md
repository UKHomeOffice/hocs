---
layout: sub-navigation.njk
order: 18
title: Deployments
description: High level deployment infrastructure information
---

[[toc]]

This documentation covers high level deployment infrastructure information, but does not detail a specific release process. There are additional steps and processes which should be taken around deployments including but not limited to product management approvals and monitoring, but they are out of scope of this documentation.


## Deployment configuration
Environment deployment configuration is controlled through repositories. There are separate repositories for [notprod 🔒](https://github.com/UKHomeOffice/hocs-deployments-notprod) and [prod 🔒](https://github.com/UKHomeOffice/hocs-deployments-prod) environments. The repositories hold release configuration for multiple environments.

Fork the [base deployment template](https://github.com/UKHomeOffice/hocs-deployments-base) to create new deployment configuration repos.

Services are packaged as [Helm](https://helm.sh/) packages, defined in [helmfile specs](https://github.com/helmfile/helmfile) and releases through to environments are orchestrated through [Kubernetes](https://kubernetes.io/).

> This documentation uses the deployment template as an example deployment repository. In a real scenario, the changes would be committed against the relevant deployment repository.

## Deployment pipeline
The Drone pipeline configuration is defined in the [`.drone` file](https://github.com/UKHomeOffice/hocs-deployments-base/blob/main/environments/example/.drone.yml).

The drone file runs the [helmfile](https://github.com/UKHomeOffice/hocs-deployments-base/blob/main/helmfile-deploy.sh) deploy script.

## Helm
Default Helm charts for services are configured in [`hocs-helm-charts`](https://github.com/UKHomeOffice/hocs-helm-charts).

The Helm charts are consumed in deployment configuration through the [`charts.yaml`](https://github.com/UKHomeOffice/hocs-deployments-base/blob/main/charts.yaml#L7) files which in turn is referenced in the [`helmfile.yaml`](https://github.com/UKHomeOffice/hocs-deployments-base/blob/main/helmfile.yaml#L12).

Helm chart values can be overwritten on an individual service and environment level through [`values` files in the environment directories](https://github.com/UKHomeOffice/hocs-deployments-base/tree/main/environments/example/values).

More detailed documentation around Helm chart specifics is detailed in the [generic-service README](https://github.com/UKHomeOffice/hocs-helm-charts/blob/main/charts/generic-service/README.md).

## Create a Release
To create a Release, a PR is created in the deployment repository with the changes to be released into the environment.

When the PR is approved and merged, the merge to `main` triggers a release to the environment.

### Release new versions of services
If the changes are new versions of services to be deployed, the [versions file](https://github.com/UKHomeOffice/hocs-deployments-base/blob/main/environments/example/versions.yaml) is updated with the required versions and services.



