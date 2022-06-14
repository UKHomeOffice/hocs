#!/bin/bash
set -euo

export AWS_ACCESS_KEY_ID=UNSET
export AWS_SECRET_ACCESS_KEY=UNSET
export AWS_DEFAULT_REGION=eu-west-2

ELASTIC_MAPPING_PATH="/docker-entrypoint-initaws.d/elastic_mapping.json"

if ! [[ -f "${ELASTIC_MAPPING_PATH}" ]]
then
    echo "${ELASTIC_MAPPING_PATH} was not found."
    exit 1
fi

until curl localhost.localstack.cloud:4566/es/eu-west-2/decs --silent | grep -q "elasticsearch"; do
   sleep 30
   echo "Waiting for ElasticSearch to be ready..."
done

curl -X PUT localhost.localstack.cloud:4566/es/eu-west-2/decs/local-case --silent -H "Content-Type: application/json" -d "@${ELASTIC_MAPPING_PATH}"
