#!/bin/bash
echo "Pulling latest and setting up infrastructure services"
docker-compose up -d postgres localstack clamav converter keycloak
