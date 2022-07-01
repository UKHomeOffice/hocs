#!/bin/bash
set -euo

until curl 'localhost.localstack.cloud:4566/es/eu-west-2/decs/_cat/indices?v' --silent | grep -q "local-case"; do
   sleep 20
   echo "Waiting for Elasticsearch Index to be present..."
   docker-compose -f ./docker/docker-compose.yml logs -t
   curl 'localhost.localstack.cloud:4566/es/eu-west-2/decs/local-case'
done
