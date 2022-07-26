#!/bin/bash
echo "Setting up services"

COMPOSE_SERVICES="casework documents info workflow"

docker-compose -f ./ci/docker-compose.yml pull ${COMPOSE_SERVICES}

docker-compose -f ./ci/docker-compose.yml up -d ${COMPOSE_SERVICES}

docker ps
