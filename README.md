# DECS

View developer documentation in GitHub Pages: [DECS Developer Documentation](https://ukhomeoffice.github.io/hocs/)

## Documentation
Documentation is in the `documentation` directory.

It makes up a static site built with Eleventy and the [XGOV-UK Eleventy Plugin](https://x-govuk.github.io/govuk-eleventy-plugin/).
To build and run the site locally use in the `documentation` directory:
```
npx eleventy --serve
```

The site is built and deployed to GitHub Pages via configured Actions and Workflows on the `hocs` repo.

## Troubleshooting
### 403 on Frontend

The frontend container doesn't handle authentication, as it is handled
by a proxy before it hits the app. For Docker-based local development there
is a `frontend-proxy` service in `ci/docker-compose.yml` which injects
the usual authentication headers and exposes the app at `http://localhost:8094`.
There is also a `management-ui-proxy` service exposing management UI at
`http://localhost:8095` using the same auth headers.
Header values can be supplied from `ci/.env`, which should stay uncommitted.
In particular, `FRONTEND_PROXY_AUTH_USER_ID`,
`FRONTEND_PROXY_AUTH_ROLES`, and `FRONTEND_PROXY_AUTH_GROUPS` can stay local.
Use `ci/.env.example` as the starting template and copy it to `ci/.env`.
You can get the required values from
[Local Developer Environment Setup (Confluence)](https://collaboration.homeoffice.gov.uk/x/qwBKBg).
When starting `frontend-proxy`, `docker compose -f ./ci/docker-compose.yml ...`
will load `ci/.env` automatically.

If you change `ci/.env` after `frontend-proxy` is already running, recreate the
container so the updated header values are applied.

If you still run the `frontend` container directly on `http://localhost:8080`,
you'll need to set authentication headers yourself using (for example) a
browser extension. This might manifest itself as a browser timeout: check
stderr before assuming something else is wrong.
