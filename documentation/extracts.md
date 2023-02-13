---
layout: sub-navigation.njk
order: 12
title: Extracts
description: Extracts in CSV file format can be generated to give users the ability to produce reports.
---

[[toc]]

DECS provides a number of extracts in CSV file format to give users the ability to produce reports. To get access to these reporting extracts, a specific role has to be added to a user within keycloak.

The user will need to have access to the environment to pull the extract and will need to be logged into the application to pull the extract (user will be prompted to login if not already authenticated).

Most extracts are generated from the database at the time the extract is requested, and therefore show live data for the environment targeted.

Extracts are generated via requests through to [hocs-audit](https://github.com/UKHomeOffice/hocs-audit) and defined [services](https://github.com/UKHomeOffice/hocs-audit/tree/main/src/main/java/uk/gov/digital/ho/hocs/audit/service).

## Extract types
There are 3 standard types of extracts:

- Case Type Extracts - which have data pertaining to individual cases.
- Environment Extracts - which have data pertaining to the entire environment.
- SOMU (Single Object, Multiple Use) Type Extracts - which have data pertaining to SOMU objects attached to cases.

Not all user groups require all extracts, as some extract types cover concepts unused in their workflows.

### Case Type
Case type extracts cover the extraction of data for cases which sit underneath a specific case type.

Case Type exports [execute via the `DataExportResource`](https://github.com/UKHomeOffice/hocs-audit/blob/main/src/main/java/uk/gov/digital/ho/hocs/audit/entrypoint/DataExportResource.java).

#### Types
The available export types and purposes:

| Type           | Purpose                                                                                                                                                           |
|----------------|-------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| CASE_DATA      | Provides a flat view of case data                                                                                                                                 |
| ALLOCATIONS    | Provides a view of every time a case has been allocated and unallocated, as well as the entry and exit times for each stage and also the deadlines for each stage |
| TOPICS         | Provides all the topics added to a case by date range                                                                                                             |
| CORRESPONDENTS | Link the UUIDS from case data to correspondents                                                                                                                   |
| CASE_NOTES     | Provides the case notes added to a case by date range                                                                                                             |
| EXTENSIONS     | Provides details on all extensions applied to a case                                                                                                              |
| APPEALS        | Provides details on all appeals added to a case                                                                                                                   |
| INTERESTS      | Provides details on all interest from internal and external sources recorded against a case                                                                       |
| SUSPENSIONS    | Provides details on each time a case has had a suspension applied or removed                                                                                      |

#### Example path
Example path, with parameters `CASETYPE`, `fromDate`, `toDate`, `EXPORTTYPE`:
```
/export/CASETYPE?fromDate=YYYY-MM-DD&toDate=YYYY-MM-DD&exportType=EXPORTTYPE
```

### Environment 
Environment exports [execute via the `StaticExportResource`](https://github.com/UKHomeOffice/hocs-audit/blob/main/src/main/java/uk/gov/digital/ho/hocs/audit/entrypoint/StaticExportResource.java).

#### Types
The available environment export types are:

| Type        | Purpose                                                                  |
|-------------|--------------------------------------------------------------------------|
| Topics      | Provides a list of topics in the database, with matching UUIDS           |
| Teams       | Provides a list of teams in the database, with matching UUIDS            |
| Units/teams | Provides a list of units and their associated teams, with matching UUIDS |
| Users       | Provides a list of users in the database, with matching UUIDS            |

#### Example path
Example path:
```
/export/topics
```

### Single Object, Multiple Use (SOMU)
SOMU exports [execute via the `DataExportResource`](https://github.com/UKHomeOffice/hocs-audit/blob/main/src/main/java/uk/gov/digital/ho/hocs/audit/entrypoint/DataExportResource.java#L86).

Only some combinations of case types and SOMU types result in valid extract URLs, as not all case types use SOMU functionality.

#### Example path
Example path, with parameters `CASETYPE`, `SOMUTYPE`, `fromDate`, `toDate`:
```
/export/somu/CASETYPE?somuType=SOMUTYPE&fromDate=YYYY-MM-DD&toDate=YYYY-MM-DD
```

### Custom exports
Some user groups have specific custom exports [which execute via the `CustomExportResource`](https://github.com/UKHomeOffice/hocs-audit/blob/main/src/main/java/uk/gov/digital/ho/hocs/audit/entrypoint/CustomExportResource.java#L29).

The custom exports are based on materialized views, [defined in `hocs-audit`](https://github.com/UKHomeOffice/hocs-audit/blob/main/config/materializedviews/Audit-Schema-DataUpdates.sql).

The materialized views can be generated on a scheduled job processing the report ahead of time. This means reports can be ready for download immediately, but with the drawback they do not present a real-time snapshot.

Scheduled refresh jobs are [configured in the Helm charts](https://github.com/UKHomeOffice/hocs-helm-charts/blob/main/charts/hocs-audit/templates/refresh-dcu-cases-view-job.yaml) and enabled on a per-environment deployment-value basis, [also managed via Helm🔒️](https://github.com/UKHomeOffice/hocs-deployments-prod).

#### Example path
Example path, with parameter `MATERIALIZEDVIEW`:
```
/export/custom/MATERIALIZEDVIEW
```

## Permissions
Users do not get access to the extract functionality by default. A subset of users can access extracts, providing they have the appropriate Keycloak roles.

The required role depends on the user and the case type of the exports the user is requesting.

Roles follow the pattern: `CASETYPE_EXPORT_USER`.

The role/URI configuration is managed via [Helm chart values](https://github.com/UKHomeOffice/hocs-helm-charts/blob/main/charts/hocs-extracts/values.yaml#L51), with roles added to users via Keycloak.

## Configuration
Some [extract configuration is defined in JSON](https://github.com/UKHomeOffice/hocs-audit/tree/main/src/main/resources/config) in `hocs-audit`.
