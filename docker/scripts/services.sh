#!/bin/bash
echo "Pulling latest and setting up services"
docker-compose up -d documents audit workflow casework info search templates frontend refresh_members
