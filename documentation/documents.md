---
layout: sub-navigation.njk
order: 13
title: Documents
description: DECS handles documents related to the processing of correspondence 
---

[[toc]]

Documents handled by DECS include external correspondence items themselves, and documents generated within the department which relate to a piece of external correspondence.

## Document categories
There are two main categories of documents handled by the platform. These can be broadly categorised as correspondence originating from outside the department, and documents originating from within the department.

### External correspondence
The format of external correspondence depends on the area of the department and the scenario. Examples include letters or emails received by the organisation from correspondents outside the department.

### Documents originating within the department
Documents relating to a piece of external correspondence can be generated from within the department, and attached to a case on the system. An example of an internally generated document includes a reply from the department to an external piece of correspondence.

Some documents will be produced unique in relation to a specific piece of correspondence. Other documents may be more generic, such as a template or Standard Line.

#### Templates
Templates can be used to increase efficiency when producing documents, ensuring a consistent format.

For some user groups, DECS offers a Template capability. Templates functionality is served via [the `hocs-templates` service](https://github.com/UKHomeOffice/hocs-templates), and managed by user groups via self-serve Management User Interface (MUI) capability, provided by [the `hocs-management-ui` service](https://github.com/UKHomeOffice/hocs-management-ui). 

#### Standard Lines
Some user groups make use of a Standard Lines capability, for standard Official responses to external correspondence.

Standard Lines are managed via self-serve Management User Interface (MUI) capability, provided by [the `hocs-management-ui` service](https://github.com/UKHomeOffice/hocs-management-ui).

## Case relationship
A case would be expected to hold at least one piece of external correspondence. 

A case may hold more than one piece of external correspondence, but all subsequent documents would have a relation to the initial piece of external correspondence.

An example in this scenario would be where an exchange of correspondence between the department and a correspondent has taken place; all records of the exchange would be stored against the case.

## Document storage
Documents are stored in S3 buckets. Documents uploaded to the system are first placed in an untrusted bucket before being processed.

Once processing is complete and successful, documents are moved to a trusted bucket.

## Document processing
A document uploaded to DECS goes through several steps in a process flow before being deemed ready to be accessed on a case.

While a document is being processed, it is presented in a "Pending" state to the user on a case.

### Supported formats
Supported document formats are [defined in the Helm charts](https://github.com/UKHomeOffice/hocs-helm-charts/blob/main/charts/hocs-frontend/values.yaml#L25).

Local network policies may restrict certain document formats being transferred across a network. In addition to defining document types in a Helm chart, ensure local network policies allow for the transfer of the desired document types.

## Conversion and previews
DECS holds the original documents uploaded to the system, but also converts documents into `.pdf` formats to be displayed in a preview panel on a case view.

A user can view a converted document in the preview panel within DECS on a case, or alternatively download the original document from the case for viewing locally on a machine.

In some cases, the user experience is better when downloading the original document and viewing locally on a machine. This is due to limitations in what types of documents can be reasonably converted to `.pdf` format.
