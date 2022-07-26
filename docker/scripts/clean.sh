#!/bin/bash
echo "Tearing down docker-compose and clearing volumes"
docker-compose -f ./docker/docker-compose.yml rm -vfs
