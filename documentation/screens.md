---
layout: sub-navigation
order: 8
title: Screens
related:
  sections:
    - title: Related links
      items:
        - text: Fields
          href: ./fields
        - text: Secondary Actions
          href: ./secondary-actions
---

Screens (or forms) are used throughout the frontend to collect information from the user.

There are two different types of screens within the system:
- [Global](#global)
- [Case specific](#case-specific)

Screens are stored within the `hocs-workflow` service [(link)](https://github.com/UKHomeOffice/hocs-workflow/tree/main/src/main/resources/screens). The name of the file is the name of the screen. 

### Global

These forms are embedded are used outside of BPMN workflows and aren't directly involved in the process flow of a case.

### Case specific

These screens are used directly within a cases BPMN flow and outcomes of these can drive the direction of a case.

## Schema

```json
{
  "title": "",
  "defaultActionLabel": "",
  "fields": [],
  "secondaryActions": [],
  "validation": "{}",
  "props": {},
  "summary": []
}
```

### Title

The title of the form to display to the user.

### Default action label

The label that is displayed as the submit button.

### Fields

A list of [fields](./fields) that should be displayed to the user.

### Secondary actions

A list of [secondary actions](./secondary-actions) that the user can select. 

> These don't cause a form submission and thus case data is not updated with current form values on click.

### Validation

Form level validation that is run on submission of the form [(link)](https://github.com/UKHomeOffice/hocs-frontend/blob/main/server/middleware/form/validation.js#L7).

### Properties

This is a collection of 'other' key-value pairs that should be passed through to the resulting component.

### Summary 

A list of basic mapping displaysAllows for a basic field case data mapping display under the form.

#### Summary field schema

```json
{
  "label": "", 
  "renderer": "", 
  "attribute": ""
}
```

##### Label

The label to show to the user.

##### Renderer

An optional renderer that designates the format that the data should be rendered as.

##### Attribute

The case data value that the data should be pulled from.
