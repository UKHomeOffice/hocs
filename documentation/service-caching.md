---
layout: sub-navigation
order: 7
title: Service level caching
---

DECS uses caching to enhance the performance of requests made for infrequently changing data, this includes amongst others, screen schemas, entity-lists, users, and teams.

Caching is enabled at the service level and happens in:

- hocs-casework: caching of data from hocs-info-service
- hocs-workflow: caching of data from hocs-info-service
- hocs-frontend: caching of static list data from hocs-info-service

Caching is implemented in hocs-casework and hocs-workflow using the caching library Caffeine, using the following configuration:

```
spring.cache.caffeine.spec=initialCapacity=500,expireAfterWrite=3600s
```

## Frontend lists
Lists in DECS can be configured in `./hocs-frontend/server/lists/index.js` as `listService.types.STATIC` or `listService.types.DYNAMIC`.

If a list is configured as `DYNAMIC`, the list is not cached, and is called on every hydration of a schema field that uses that requested dynamic list.

