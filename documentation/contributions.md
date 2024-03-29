---
layout: sub-navigation.njk
order: 15
title: Contributions
description: Contributions can be added to cases
---

[[toc]]

## What are Contributions?
Contributions are a feature of the platform and are used by tenants who have the need to routinely seek information from third parties when working a case through a workflow.

A contribution is a piece of information which is requested from a third party by a caseworking team. A third party in this instance could be anyone external to the teams directly involved in the processing of the correspondence, typically a third party could include other teams in the department.

Each tenant who utilises the Contributions feature have their own need for contributions, therefore the Contributions functionality is high level and generic, so it can be adapted to specific workflow needs.

There is a distinction made in the platform between requests for a single contribution at a workflow stage, and requests for [multiple contributions](#multiple-contributions-%26-somu).

## How are Contributions used?
The Contributions capability is used by caseworking teams to track what contributions from third parties are being requested for a case. The caseworking teams can track:
- what has been requested
- to what third party the request has been made
- when a request was made
- when a repsonse is due

## Multiple Contributions & SOMU
In some instances, a case may need more than one contribution from third parties to progress along a workflow. Multiple contributions may be requested from one or more third parties. To handle this scenario, the concept of Multiple Contributions exists.

A large part of the generic design of Multiple Contributions is known as the Single Object, Multiple Use (SOMU) capability.

The SOMU (pronounced so-mew) pattern allows for configurations to be defined, to cater for various workflow use cases.

### SOMU Types
SOMU configurations are known as a "SOMU Type". A SOMU Type is [defined in the info schema](https://github.com/UKHomeOffice/hocs-info-service/blob/main/src/main/java/uk/gov/digital/ho/hocs/info/domain/model/SomuType.java), and holds a defined schema.

#### SOMU Schema
A SOMU Type holds a configuration object known as a schema. SOMU Type schemas hold definitions of forms and tables. Forms and tables are [rendered in the UI via `hocs-frontend`](https://github.com/UKHomeOffice/hocs-frontend/blob/main/src/shared/common/forms/composite/somu-list.jsx).

##### Form definitions
The schema defines the configuration and behaviour in the UI for the Contributions forms.

A typical SOMU Type schema will define forms for the SOMU Type to use, and fields which should be utilised on the forms. Examples of defined forms on a SOMU Type could include forms for adding and editing a Contribution Request.

##### Table renderer definitions
A SOMU Type schema also defines the table renderer to use for the Contributions display. The table renderer is a different UI component from the forms, and is used for displaying the status of Contribution Requests within [a workflow screen](../screens).

From within the Contribution table renderer component, displayed on a workflow screen, Contribution Requests can be added and edited.

Typical information to display in a Contributions table renderer within a workflow screen includes when a request is due to be responded to and the type of request made to a third party.

This allows for a quick view of the status of a Contribution Request when a caseworker views the workflow screen on a case.

### SOMU Items
When a Contribution Request is created on a case, a corresponding [record of a SOMU Item](https://github.com/UKHomeOffice/hocs-casework/blob/main/src/main/java/uk/gov/digital/ho/hocs/casework/domain/model/SomuItem.java) is created.

A SOMU Item holds the information related to a specific Contribution Request. This information would typically be the information gathered from the form, defined by the SOMU Type.

A SOMU Item is a piece of information relating to a case, and therefore is stored in the casework schema.

## Extracts
Contribution Requests implemented via the SOMU pattern [have specific extracts](../extracts/#single-object%2C-multiple-use-(somu)).

## Workstacks
Contribution Requests can be [processed on stages](https://github.com/UKHomeOffice/hocs-casework/blob/main/src/main/java/uk/gov/digital/ho/hocs/casework/contributions/ContributionsProcessorImpl.java), and displayed in [workstacks](../workstacks) with appropriate workstack columns and renderer defined.
