---
layout: sub-navigation.njk
order: 1
title: Running services locally
---

[[toc]]

This documentation covers how to run services locally, outside of Docker, such as from an IDE.

## VM options
There are pre-requisite VM options that need to be specified for each project these are specified below:

| Project             | VM options                                                  |
|---------------------|-------------------------------------------------------------|
| hocs-audit          | -Dspring.profiles.active=development,local,consumer         |
| hocs-case-creator   | -Dspring.profiles.active=development,local,<ukvi/migration> |
| hocs-casework       | -Dspring.profiles.active=development,local                  |
| hocs-docs           | -Dspring.profiles.active=development,local                  |
| hocs-docs-converter | -Dspring.profiles.active=development                        |
| hocs-info-service   | -Dspring.profiles.active=development,local                  |
| hocs-notify         | -Dspring.profiles.active=development,local                  |
| hocs-search         | -Dspring.profiles.active=development,localstack,consumer    |
| hocs-templates      | -Dspring.profiles.active=development                        |
| hocs-workflow       | -Dspring.profiles.active=development,local                  |

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
