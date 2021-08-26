#!/bin/bash
echo "Pulling latest and setting up infrastructure services"
docker-compose up -d postgres localstack clamav aws_cli converter keycloak load_elastic data_migration
