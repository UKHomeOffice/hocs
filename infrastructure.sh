#!/bin/bash
echo "Pulling latest and setting up infrastructure services"

COMPOSE_SERVICES="keycloak localstack postgres"

docker-compose -f ./ci/docker-compose.yml pull ${COMPOSE_SERVICES}

COMPOSE_SERVICES=${COMPOSE_SERVICES} INCLUDE_ELASTIC=false ./ci/infrastructure.sh

docker ps
