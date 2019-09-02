#!/bin/sh

set -ex

cd /var/lib/docker/hr_app/maomao_docker_compose

docker-compose stop

git pull 

docker-compose build
docker-compose up -d

