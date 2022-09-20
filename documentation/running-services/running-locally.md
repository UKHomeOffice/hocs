---
layout: sub-navigation
order: 1
title: Running services locally
---

This documentation covers how to run services locally, outside of Docker, such as from an IDE.

## VM options
There are pre-requisite VM options that need to be specified for each project these are specified below:

| Project             | VM options                                                     |
|---------------------|----------------------------------------------------------------|
| hocs-casework       | -Dspring.profiles.active=development,local,postgres            |
| hocs-docs           | -Dspring.profiles.active=development,local,postgres            |
| hocs-workflow       | -Dspring.profiles.active=development,local,postgres            |
| hocs-info-service   | -Dspring.profiles.active=development,local,postgres            |
| hocs-audit          | -Dspring.profiles.active=development,local,postgres            |
| hocs-docs-converter | -Dspring.profiles.active=development,local,postgres            |
| hocs-templates      | -Dspring.profiles.active=development,local,postgres            |
| hocs-search         | -Dspring.profiles.active=development,local,postgres,localstack |

## Frontend modules
For the frontend modules `hocs-frontend` and `hocs-management-ui`:

Build with:
``` 
npm run build-dev
```

Start the application with:
``` 
npm run start-dev
```
