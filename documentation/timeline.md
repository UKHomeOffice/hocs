---
layout: sub-navigation.njk
order: 16
title: Timeline
description: Cases are presented with a timeline
---

[[toc]]

## What is the timeline?
A case on DECS is presented with a timeline. The timeline highlights events and case notes added in the lifecycle of a case.

The timeline displays items in reverse chronological order, with the most recent item first.

## Timeline items
Timeline items can be thought of as belonging within a category:
- System event
- Business event
- Process event

### Events
#### System events
System events are characterised as actions the system performs, initiated by a user action.

An example of a system event is creation of a case.

System events are [defined in `hocs-frontend` as an `AuditEvent`](https://github.com/UKHomeOffice/hocs-frontend/blob/main/src/shared/common/components/case-notes.jsx#L15).

#### Business events
Business events are things that happen within the service which are of interest to the business, as opposed to system events which are used trigger actions within the system.

An example of a business event is updating a data field "behind-the-scenes" based off the user selection of an option on a different field.

Business events are handled by the [`BusinessEventService`](https://github.com/UKHomeOffice/hocs-workflow/blob/main/src/main/java/uk/gov/digital/ho/hocs/workflow/api/bpmn/BusinessEventService.java) and [presented in `hocs-frontend` as an `AuditEvent`](https://github.com/UKHomeOffice/hocs-frontend/blob/main/src/shared/common/components/case-notes.jsx#L15).

Allocations are an example of a system event, but used as pseudo business events in the timeline and extracts. Allocation extracts are available via the [`AllocationExportService`](https://github.com/UKHomeOffice/hocs-audit/blob/main/src/main/java/uk/gov/digital/ho/hocs/audit/service/AllocationExportService.java).

#### Process events
Process events are initiated from actions taken within a business process model.

An example of a process event includes scenarios where a case may be rejected from a stage and sent back to a previous stage with a rejection note. The rejection note is inputted by the user as free form text and the rejection note is added to the timeline.

Process events are actioned from within screens in an activity in the BPMN workflows.

Process events present in the UI to the user like a case note; they are included in the list of [items classed as case notes in `hocs-frontend`](https://github.com/UKHomeOffice/hocs-frontend/blob/main/src/shared/common/components/case-notes.jsx#L50).

### Case notes
Case notes are created by users directly on the timeline by adding a Case Note and entering free form text.

Case notes can be created at any point in the lifecycle of a case.

While there are [many defined types of case note](https://github.com/UKHomeOffice/hocs-frontend/blob/main/src/shared/common/components/case-notes.jsx#L50), a case note created from the timeline will be defined with the type `MANUAL`.

Case notes can be exported via the [`CaseNoteExportService`](https://github.com/UKHomeOffice/hocs-audit/blob/main/src/main/java/uk/gov/digital/ho/hocs/audit/service/CaseNoteExportService.java).

## Technical distinctions
There is a technical distinction to be made between events and case notes.

### Events
The events are stored in the audit schema, defined in [`hocs-audit`](https://github.com/UKHomeOffice/hocs-audit/tree/main/src/main/resources/db/migration/postgresql).

System and Business events can originate from various services depending on the action being performed.

Process events originate from tasks actioned via the workflow, and therefore originate from `hocs-workflow`.

### Case notes
Case notes are stored in the casework schema, defined in [`hocs-casework`](https://github.com/UKHomeOffice/hocs-casework/tree/main/src/main/resources/db/migration/postgresql).
