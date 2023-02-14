---
layout: sub-navigation.njk
order: 12
title: Extracts
description: Extracts in CSV file format can be generated.
---

[[toc]]

DECS provides a number of extracts in CSV file format. To get access to these extracts, a specific role [has to be added to a user within keycloak](#permissions).

The user will need to have access to the environment to pull the extract and will need to be logged into the application to pull the extract (user will be prompted to login if not already authenticated).

Most extracts are generated from the database at the time the extract is requested, and therefore show live data for the environment targeted.

Extracts are generated via requests through to [hocs-audit](https://github.com/UKHomeOffice/hocs-audit) and defined [services](https://github.com/UKHomeOffice/hocs-audit/tree/main/src/main/java/uk/gov/digital/ho/hocs/audit/service).

## Definition
The terms "extracts" and "reports" are sometimes used interchangeably, however there is an important distinction to be made: The CSV Extracts do not report on anything themselves, they are purely a raw extract of data held on the platform.

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

SOMU types are [configured in the info-schema🔒](https://github.com/UKHomeOffice/hocs-data).

#### Example path
Example path, with parameters `CASETYPE`, `SOMUTYPE`, `fromDate`, `toDate`:
```
/export/somu/CASETYPE?somuType=SOMUTYPE&fromDate=YYYY-MM-DD&toDate=YYYY-MM-DD
```

### Custom exports
Some user groups have specific custom exports [which execute via the `CustomExportResource`](https://github.com/UKHomeOffice/hocs-audit/blob/main/src/main/java/uk/gov/digital/ho/hocs/audit/entrypoint/CustomExportResource.java#L29).

The custom exports are based on materialized views, [defined in `hocs-audit`](https://github.com/UKHomeOffice/hocs-audit/blob/main/config/materializedviews/Audit-Schema-DataUpdates.sql).

#### Scheduled jobs
The materialized views can be generated on a scheduled job processing the extract ahead of time. This means large custom extracts can be ready for download immediately, but with the drawback they do not present a real-time snapshot.

As the amount of data involved in the generation of the view increases, the time taken to generate the view will also grow. For very large datasets this may need to be considered when selecting a time of day to run a extract, consider; maintenance windows, operational support hours, standard user group operating hours.

Scheduled refresh jobs interact directly with the database. The jobs are [configured in the Helm charts](https://github.com/UKHomeOffice/hocs-helm-charts/blob/main/charts/hocs-audit/templates/refresh-dcu-cases-view-job.yaml) and enabled on a per-environment basis, also managed via Helm for all [notprod🔒](https://github.com/UKHomeOffice/hocs-deployments-notprod) and [prod🔒️](https://github.com/UKHomeOffice/hocs-deployments-prod) environments.

The jobs are enabled by providing values in a `hocs-audit` deployment, for example:
```
dcuCaseView:
  enabled: true
```

#### Manually refreshing materialized views
If a materialized view requires a manual refresh, for example in a local development environment, or in the event a scheduled job fails, the SQL can be executed or the cron job started.


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

## Conversion request parameters
Some extracts allow optional parameters to toggle conversions in the extract processing.

Depending on the extract, there are two types of conversion which can be toggled; a header converter and a data converter.

### Header conversion
When some user groups migrated from legacy systems onto DECS, there was a need to align the extract formatting to the legacy format to support downstream processing.

The `convertHeader` parameter was introduced to toggle this behaviour, along with [the `HeaderConverter` functionality](https://github.com/UKHomeOffice/hocs-audit/blob/main/src/main/java/uk/gov/digital/ho/hocs/audit/service/domain/converter/HeaderConverter.java).

The mapping between the legacy headers and DECS headers are defined in a [configuration mapping file](https://github.com/UKHomeOffice/hocs-audit/blob/main/src/main/resources/headers.config).

The header conversion translates the column headers on the extracts to values from the legacy system.

### Data conversion
Data conversion can also be toggled on some extracts via the `convert` parameter.

If the `convert=true` parameter is passed in the request, translations are performed on data within the extract prior to serving the CSV to the user.

UUIDs exist as data values within the raw data, however to make the extract more readable and workable in downstream processing, the UUIDs can be converted to a more readable and understandable format.

Types of UUIDs which can be converted include; correspondents, users, topics, and entity lists, however what is converted on each extract is specified on the service, for example [within the `CaseDataExportService`](https://github.com/UKHomeOffice/hocs-audit/blob/main/src/main/java/uk/gov/digital/ho/hocs/audit/service/CaseDataExportService.java#L128).
