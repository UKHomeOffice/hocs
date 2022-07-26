#!/bin/bash
echo "Setting up services"
docker-compose -f ./ci/docker-compose.yml up -d casework documents info workflow
docker ps
