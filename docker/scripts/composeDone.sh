#!/bin/sh

while ! wget --spider --timeout=5 http://localhost:8080/health 
do
  sleep 10
done

