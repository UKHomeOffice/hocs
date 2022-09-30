---
layout: sub-navigation
order: 30
title: Domain map
description: Set of statements about how domain entities relate to each other.
---

## Direct relationships
- A case is for a single case type
- A case type is owned by a single business unit
- A business unit can own multiple case types
- A case consists of multiple stages
- A user can belong to multiple user groups
- A user group is assigned to a single case type
- A user group can be assigned to multiple stages of a case type
- A user group has a single workstack

## Indirect relationships
- A user can see multiple workstacks (they can belong to many user groups)
- A user cannot see cases that are in the same stage across case types in a single view