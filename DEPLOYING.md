kubectl command for fetching current versions on an environment:

```
kubectl get deployment -n <ENVIRONMENT> -o custom-columns=:"metadata.labels.version,SERVICE:metadata.name"
```

Bash functions for prod deployments:

```
function deploy() {
    drone build promote -p VERSION=$2 $1 $3 $4
}
 
function deploy_build() {
    deploy $1 $2 $(drone build ls $1 --branch main --event tag | grep -m1 -Eo 'Build #[[:digit:]]{1,}' | cut -b 8-) $3
}

function deploy_cs_demo() {
    deploy_build ukhomeoffice/$1 $2 cs-demo
}

function deploy_wcs_demo() {
    deploy_build ukhomeoffice/$1 $2 wcs-demo
}

function deploy_cs_prod() {
    deploy_build ukhomeoffice/$1 $2 cs-prod
}

function deploy_wcs_prod() {
    deploy_build ukhomeoffice/$1 $2 wcs-prod
}
```

Usage:
```
deploy_cs_demo hocs-docs 0.6.26
deploy_wcs_demo hocs-docs 0.6.26
deploy_cs_prod hocs-docs 0.6.26
deploy_wcs_prod hocs-docs 0.6.26
```
