---
layout: sub-navigation.njk
order: 14
title: Search
description: DECS offers a search capability
---

[[toc]]

Users can use the search capability to locate open or closed cases held on the system.

## Infrastructure
Search is provided by deployments of [`hocs-search`](https://github.com/UKHomeOffice/hocs-search), SQS queues, and OpenSearch indexes.

For users of the service, Search can be accessed in the UI, with the UI defined in [`hocs-frontend`](https://github.com/UKHomeOffice/hocs-frontend).

## Process flow
The search capability is driven by data in OpenSearch indexes.

The process of adding data into the index consists of:
- Data is provided to the index by first being sent as an event onto an SNS topic.
- The queue takes the notification from SNS and a message is added to the search queue for processing. 
- The message is then processed by `hocs-search` and added into the search index.

## OpenSearch index

## UI form
