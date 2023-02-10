---
layout: sub-navigation.njk
order: 1
title: Submodules
---

This project contains a 'ci' submodule with a docker-compose and infrastructure scripts in it; `hocs-ci-infrastructure`.

## Add a submodule to a repo
If you are creating a new repository you can add the ci submodule with:
```console
$ git submodule add -b main https://github.com/UKHomeOffice/hocs-ci-infrastructure.git ci
```

## Pulling submodules
Most modern IDEs will handle pulling this automatically for you, but if not, run:

### For the first time
```console
$ git submodule update --init --recursive
```

### Updating a submodule
First make the change to the `hocs-ci-infrastructure` module and have it merged to `main`.

Then update the submodule in the consuming repo:
```
$ git submodule update --remote --merge
```

To apply the change in the consuming module, commit and merge the updated submodule reference to the consuming module.
