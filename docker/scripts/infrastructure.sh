#!/bin/bash
echo "Pulling latest and setting up infrastructure services"
docker-compose -f ./docker/docker-compose.yml pull
docker-compose -f ./docker/docker-compose.yml up -d keycloak localstack postgres
docker ps
