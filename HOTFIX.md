# Deploying hotfixes to production

The keywords *must*, *must not*, *should*, and *may* in this document are to
be interpreted as described in RFC 2119.

## Triage the problem
Before starting work, you *should* check a hotfix is a suitable approach to take.
A good hotfix meets some or all of these criteria:

* fixing an urgent live service issue
* fixing a blocking problem for development
* unable to wait for a standard release
* isolated on a single service
* easy to revert
* doesn't add new features
* atomic (does exactly one thing)
* has a short lifetime
* has no side effects
* uncontroversial
* is not needed after the next release

## Identify the current state of production

First, find the version of the service you are hotfixing that is currently
running in production. You *may* check the latest release notes on Confluence.

For extra assurance, double-check using `kubectl` on the production cluster:

```console
$ kubectl get deployments hocs-info-service | grep image
    ...
    image: quay.io/ukhomeofficedigital/hocs-info-service:1.0.0
```

## Branch off the production version for your hotfix

Instead of branching off the head of the default branch like you would for a
normal fix, for a hotfix you branch off the Git tag for that release:

```
$ git checkout 1.0.0
$ git checkout -b HOCS-1234
$ # make your changes
$ git commit
$ git push
```

You *should* use a branch name in the same vein as a routine commit, such as the
ticket number. You *may* include the word "hotfix", but don't
start your branch name with it or GitHub will not let you push.

## Open a pull request

Once you have made changes, open a pull request like you would normally.
However, instead of opening the pull request against the default branch,
open it against a special hotfix branch, which *must* start with `hotfix/`.
For example, `hotfix/HOCS-1234`.

If this hotfix isn't meant to be temporary, you *should* open a pull request
against the default branch as well, so the code you write eventually makes its
way into production as a normal release (which will overwrite the hotfix).

You *should* use a uniquely named `hotfix/` branch for every hotfix.
You *must not* push to a `hotfix/` branch currently deployed to production.

## Get your pull request reviewed

Like any normal pull request, it needs reviewing before it goes into the hotfix
branch. You *should* get agreement at this stage from stakeholders as a
requirement for the `hotfix/` branch being created.

Normal requirements for pull request approvals still apply to hotfixes, although
some are more lenient. For example, the build *must* pass, but issues like
logspam are less important (and with hotfixes, sometimes intended).

Upon approval, merge the pull request into the `hotfix/` branch as normal.

## Find the hotfix Docker tag

Drone will run a special set of steps when code is pushed to a branch starting
with `hotfix/`. It will eventually publish an image tag to the registry; find
out what that image tag was. It's usually something like
`branch-hotfix_HOCS-1234`.

## Deploy the hotfix to a non-production environment

You deploy a hotfix in the same way you would deploy any release, using the same
Drone commands. The `VERSION` is the tag you found in the previous step.

You *must not* deploy hotfixes to the QA environments via a Drone command or you
will pollute the release tags with hotfixes.
To deploy to a QA environment, you *may* edit the deployment using `kubectl`.
Get agreement from anyone using the QA environments before doing so.

## Verify the hotfix doesn't break anything

It's okay if a hotfix doesn't fix the problem it was designed to fix, so it can
bypass some of the QA steps. However, it's not okay if it causes side-effects or
regressions. Run some tests on your hotfixed non-production environment until
you, and your stakeholders, are satisfied the risk is low enough to continue.

## Deploy the hotfix to production

You deploy a hotfix to production the same way you deploy a normal release.
Instead of a release number, you release the hotfix branch.

## Adapt the next release accordingly

A hotfix will only stay in production until the next release for that component.
You should ensure any hotfix makes its way into main-line code ready for the
next standard release to production.

Monitor production. A hotfix means that production is in a non-standard state,
and it should be a priority of the development team to either revert the hotfix
when its purpose is fulfilled, or to redeploy the fix as part of a normal release
as soon as practicable.
