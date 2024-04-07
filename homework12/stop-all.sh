#!/bin/bash
docker-compose down --volumes

docker stop $(docker ps -a -q)

docker system prune
