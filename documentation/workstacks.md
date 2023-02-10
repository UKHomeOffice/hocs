---
layout: sub-navigation.njk
order: 11
title: Workstacks
---
Workstacks are a pattern implemented in DECS for casework management.

[[toc]]

## What is a workstack?
A workstack displays a collection of cases to the user.

## What workstacks are available?
There are several types of workstacks available.

### Team
Displays all the open cases allocated to a specific team. User-assigned team workstacks are displayed to the user on the main Dashboard.

### Workflow
Displays a subset of the cases allocated to a specific team; cases allocated to the team being processed on a specific workflow type.

### Stage
Displays active cases on a stage within a workflow allocated to a team.

### User
Displays all of the open cases which are allocated to the user.

### Search
Displays search results, using the workstack pattern.

## Workstack functions
In addition to displaying cases, workstacks are used for case allocations to users. Users can allocate/unallocate cases to themselves or to other users from within workstacks. 

## Workstack configuration
Workstacks are configured in the database schema and are made up of [types](https://github.com/UKHomeOffice/hocs-info-service/blob/main/src/main/java/uk/gov/digital/ho/hocs/info/domain/model/WorkstackType.java) and [columns](https://github.com/UKHomeOffice/hocs-info-service/blob/main/src/main/java/uk/gov/digital/ho/hocs/info/domain/model/WorkstackColumn.java).

Column configurations are defined at team level, casetype level, user workstacks for a specific case type, and search results.

If a workstack is loaded with no defined configuration, the system will fall back to using a system-wide default configuration.

### Search workstack type
For Search workstacks, the type must be defined with prefixed concatenated case types in alphabetical order of case type, for example `ALPHA,BRAVO_SEARCH_RESULTS`.
