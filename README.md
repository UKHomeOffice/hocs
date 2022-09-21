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
by a proxy before it hits the app. You'll need to set authentication
headers yourself using (for example) a browser extension. Ask an existing
developer for their copy. This might manifest itself as a browser timeout:
check stderr before assuming something else is wrong.
