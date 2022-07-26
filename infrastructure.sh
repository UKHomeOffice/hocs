#!/bin/bash
echo "Pulling latest and setting up infrastructure services"
docker-compose -f ./ci/docker-compose.yml pull
docker-compose -f ./ci/docker-compose.yml up -d keycloak localstack postgres
docker ps
