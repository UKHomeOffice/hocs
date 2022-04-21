# DECS

**HOCS**, known in business contexts as **DECS**,
is a tracking and routing tool that &ldquo;allows Home Office teams to
control and audit the flow of all correspondence through its
life-cycle from receipt to final response&rdquo;.

DECS is mostly written in Java, using the [Spring Boot](https://spring.io/projects/spring-boot)
library. Frontend components are written using JavaScript, often React.

Most development for DECS is open-source, but coded by developers who work at
or for the Home Office.

* **Development discussion** happens primarily on the [internal Home Office Digital slack
  instance](https://homeofficedigital.slack.com), in `#decs-dev`
  channels, with secondary discussions happening between developers using a
  video-conferencing tool.
* **Source code** is managed by the Git revision control system, with code
  hosted on GitHub.
* **Bug reports** are managed via the Home Office's self-hosted instance of Jira.
* **Code review** is managed using GitHub's merge request functionality.

## Getting the code

Almost all HOCS code is open-source and publicly available on GitHub.
Some rarely used legacy code is stored in the Home Office's own GitLab instance.

All HOCS code on GitHub is hosted within the UKHomeOffice organisation.
You can [search the organisation](https://github.com/UKHomeOffice/?q=hocs) for
a list of our repositories. Some repositories are archived, and no longer in use.

Some parts of the HOCS codebase are not publicly available.
This includes the schema used to set up the info-service.

## Docker Compose

This repository contains a [Docker Compose](https://docs.docker.com/compose/)
configuration. For information on how to get DECS running in Docker using
Docker Compose, look in the [`docker` subdirectory of this repository](docker).
