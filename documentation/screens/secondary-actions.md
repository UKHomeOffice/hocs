---
layout: sub-navigation.njk
title: Secondary Actions
order: 20
description: Information relating to screen secondary actions.
related:
    sections:
      - title: Related links
        items:
          - text: Screens
            href: ../
          - text: Fields
            href: ../fields
---
          
## Schema

```json
{
  "component": "",
  "name": "",
  "label": "",
  "validation": [],
  "props": {}
}
```

### Component

The component type that you want to render. 

Examples: 
- `backlink`
- `button`
- `backButton`

For a complete list check the `secondaryActionFactory` method in `form-repository.jsx` [(link)](https://github.com/UKHomeOffice/hocs-frontend/blob/main/src/shared/common/forms/form-repository.jsx).

### Name

The name of the field, on submission this is the attribute name that the value is saved to in the case data.

### Label

This is what is displayed on the frontend to the user. 

### Validation

On submitting a form on the frontend to progress a case forward, any specified validation is run against the field to ensure conformity.

> Validation suppressors can be specified on screens that can effectively nullify what is specified.

### Props

This is a collection of 'other' key-value pairs that should be passed through to the resulting component.
