#!/bin/bash
echo "Setting up services"
docker-compose -f ./docker/docker-compose.yml up -d casework documents info workflow
docker ps
