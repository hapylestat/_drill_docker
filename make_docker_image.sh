#!/usr/bin/env bash

if [[ -f .amsh_settings ]]; then
 . .amsh_settings
fi

PROJECT=${PROJECT:-project}


. docker-selection
docker_menu


docker pull reishin/ambari-build-sandbox:jdk11
docker build --rm --build-arg MONGODB_URL=${MONGODB_URL} -f build_container/Dockerfile -t ${PROJECT}-env:latest .