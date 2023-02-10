---
layout: sub-navigation.njk
order: 3
title: Technology stack
---

[[toc]]

## Criteria
The technology stack has been chosen based on the following criteria:
- Existing Home Office use
- Ability to reuse existing services (HO and X-GOV)
- [Cabinet Office Technology Code of Practice](https://www.gov.uk/guidance/the-technology-code-of-practice)
- Project requirements
- Team skillset

## Microservices
- Java
- Spring Boot
- Spring Data (JPA)
- Flyway (database migration) scripts

## Frontend
- NodeJS
- ReactJS

## Databases
- Postgres (AWS RDS)
- H2SQL (in memory for testing)
- Flyway (for migrations)

## Workflows
- BPMN (Business Process Model and Notation) via [Camunda](https://camunda.com/)

## Integration
- Apache Camel
- AWS SQS
- AWS SNS

## Search
- Elastic Search (AWS)

## Documents
- JODConverter (Java API to orchestrate LibreOffice)
- LibreOffice (for document conversion)
- ClamAV

## Testing
- Selenium for acceptance tests

## Other
- GitHub Actions
- Keycloak (ADFS)
