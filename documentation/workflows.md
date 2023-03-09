---
layout: sub-navigation.njk
order: 10
title: Workflows
description: The concept of a workflow is key to understanding how a case on DECS is worked.
related:
  sections:
    - title: Related links
      items:
        - text: Screens
          href: ../screens
---

[[toc]]

## What is a DECS workflow?
A workflow on DECS is defined using Business Process Model and Notation (BPMN), and is orchestrated in the application by [Camunda](https://camunda.com/).

> If you are unfamiliar with BPMN and Camunda, [follow a tutorial](https://camunda.com/bpmn/) to get a basic understanding of the principles.

The workflows are defined in and controlled by the [`hocs-workflow` service](https://github.com/UKHomeOffice/hocs-workflow/), stored in the [processes directory](https://github.com/UKHomeOffice/hocs-workflow/tree/main/src/main/resources/processes).

The DECS workflows are designed to support the caseworking areas and cover the business processes in operation required to deal with a unit of correspondence. A workflow defined in DECS is not necessarily all-encompassing of all the business processes in operation in a business unit. 


## Camunda workflows

### BPMN diagrams
Camunda when used as a workflow engine relies on `.bpmn` files that are loaded into the Camunda Engine instance when the hosting application (`hocs-workflow`) starts.

A `.bpmn` file is written in XML syntax; the syntax can be generated into a diagram then viewed/edited via tooling such as [Camunda Modeler](https://camunda.com/download/modeler/).

### Process instances
Each process is given a unique identifier within the instance so that when a process is starting the unique identifier can be passed to the Camunda engine so that it knows which process to start; for DECS, the identifier is the designated case type.

Each process has a starting node and an ending node, and a flow path that directs the process from one to another. When a process starts, the Camunda engine will process every node, task, flow and other elements of the workflow process until such time as it cannot progress any further. 

Generally, in the implementation workflows for DECS, the workflow will pause when a process requires user input or the process has ended.

### User input in workflows
User input is entirely driven by the definition for forms that appear to the user. The processes for user input are defined as User Tasks in Camunda, with a Form Key defined. The Form Key value should match the screen schema name.

![A screenshot of Camunda Modeler showing a User Task and schema defintion](../assets/images/camunda-form-key.png "A screenshot of Camunda Modeler showing a User Task and schema definition")

### Logic gateways
Gateways provide a break in the flow, whereby the direction can be changed based on variables that should be available to the Camunda process and can be used in expressions to determine which flow path to take. In the example below, a variable called "complete" is evaluated to determine if the workflow should take the path that progresses to the "End" node or the flow that takes the workflow to the "Send Complete Reminder" task.

The variables evaluated are internal within the Camunda engine and BPMN diagrams used for the flows.

![A screenshot of Camunda Modeler showing a gateway in a workflow](../assets/images/camunda-gateway.png "A screenshot of Camunda Modeler showing a gateway in a workflow")

### Service tasks
Service tasks are processes in the workflow that requires some execution of an expression that does not require the users input.

This does mean that any variables that the expression requires need to be available to the Camunda process. Process tasks can be designed provide a lot of functions, however, DECS normally uses these to execute custom methods defined in the `hocs-workflow` [BPMN service](https://github.com/UKHomeOffice/hocs-workflow/blob/main/src/main/java/uk/gov/digital/ho/hocs/workflow/BpmnService.java).

![A screenshot of Camunda Modeler showing service task configuration](../assets/images/camunda-bpmn-service.png "A screenshot of Camunda Modeler showing service task configuration")
