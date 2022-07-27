#!/bin/bash
echo "Tearing down docker-compose and clearing volumes"
docker-compose -f ./ci/docker-compose.yml rm -vfs
