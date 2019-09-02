#!/bin/sh

set -ex

docker-compose stop

cd /var/lib/docker/hr_app/maomao_docker_compose
git pull 

docker-compose build
docker-compose up -d

