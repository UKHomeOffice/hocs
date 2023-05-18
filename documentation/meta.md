---
layout: sub-navigation.njk
order: 17
title: Meta
description: Meta documentation
---

[[toc]]

## Docs-as-code
A docs-as-code approach for the developer documentation was selected, and also works alongside the organisation [DDaT 2024 strategy](https://www.gov.uk/government/publications/home-office-digital-data-and-technology-strategy-2024/home-office-digital-data-and-technology-strategy-2024#create-shared-technology-products) to promote and encourage docs-as-code models for technical documentation.

## Repository
The documentation application is [within the `hocs` repo](https://github.com/UKHomeOffice/hocs/tree/main/documentation), in the `documentation` directory.

The repository and this documentation is hosted open-source via GitHub Pages.

## Framework
This documentation makes use of the [XGOVUK Eleventy Plugin](https://x-govuk.github.io/govuk-eleventy-plugin/), and [Eleventy](https://www.11ty.dev/).

## Deployment
The deployment is run through the GitHub workflow pipeline, and is configured in the [workflow file](https://github.com/UKHomeOffice/hocs/blob/main/.github/workflows/deploy-to-pages.yml) within the `hocs` repo. 

## Contribute
To contribute to the documentation, create a branch, push the changes, and [raise a PR for approval](https://github.com/UKHomeOffice/hocs/compare) against the project.
