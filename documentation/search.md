---
layout: sub-navigation.njk
order: 14
title: Search
description: DECS offers a search capability
---

[[toc]]

Users can use the search capability to locate cases held on the system.

## Infrastructure
Search is provided by deployments of [`hocs-search`](https://github.com/UKHomeOffice/hocs-search), SNS topics, SQS queues, and OpenSearch indexes.

For users of the service, Search can be accessed in the UI, with the UI defined in [`hocs-frontend`](https://github.com/UKHomeOffice/hocs-frontend).

### Deployment profiles
A deployment of [`hocs-search`](https://github.com/UKHomeOffice/hocs-search) can be run in various profiles. The service can act as a provider, consumer, or both.

Spring profiles are [defined on the Helm chart](https://github.com/UKHomeOffice/hocs-helm-charts/blob/main/charts/hocs-search/values.yaml) for the deployment. There are multiple Helm charts if there are multiple deployments, such as two deployments; one for the provider and one for the consumer respectively.

#### Provider
As a provider, `hocs-search` will provide the search capability to the end user; no processing or queue consumption functionality is utilised.

#### Consumer
As a consumer, `hocs-search` will consume and process messages from the queue; there is no provision of search capability to the end user.

## Process
1. An event is emitted from an originating service onto an SNS topic.
2. An SQS queue takes the notification from SNS and a message is added to the search queue for processing.
3. The message is processed by `hocs-search` and added into the search index.
4. If the processing fails, the message is dropped onto a Dead Letter Queue.

### Queue processing
If the queue stops processing, changes to the index will not be actioned.

For the user, until the queue starts processing messages again, this incident can appear temporarily like a mismatch of data in what is displayed in search results versus the data displayed within a case. This is due to the source of the data; search results use the search index, accessing a case directly would call from different data sources such as databases.

## Events
There are [defined event types](https://github.com/UKHomeOffice/hocs-search/blob/main/src/main/java/uk/gov/digital/ho/hocs/search/application/queue/DataChangeType.java) which lead to changes in data in the search index.

Messages are pulled from the queue and processed through the [`SearchListener`](https://github.com/UKHomeOffice/hocs-search/blob/main/src/main/java/uk/gov/digital/ho/hocs/search/application/aws/SearchListener.java#L35).

In some cases there are custom behaviours applied to an event before the change to the search index is made.

## UI form
The form in the UI is provided by `hocs-frontend`, with the [configuration held in the node server](https://github.com/UKHomeOffice/hocs-frontend/blob/main/server/config/searchFields/config.json).

The form configuration is defined by case type which the user has access to.

Should the user have access to multiple case types, the form configurations are combined.
