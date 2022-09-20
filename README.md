# DECS

View developer documentation in GitHub Pages: [DECS Developer Documentation](https://ukhomeoffice.github.io/hocs/)

### Troubleshooting
#### 403 on Frontend

The frontend container doesn't handle authentication, as it is handled
by a proxy before it hits the app. You'll need to set authentication
headers yourself using (for example) a browser extension. Ask an existing
developer for their copy. This might manifest itself as a browser timeout:
check stderr before assuming something else is wrong.
