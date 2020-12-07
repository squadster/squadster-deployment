#!/bin/bash

# Rebuild nginx image and push it to the registry

source .env

echo $GITHUB_TOKEN | docker login -u $GITHUB_USER --password-stdin docker.pkg.github.com

docker build -t docker.pkg.github.com/squadster/squadster-deployment/nginx:$NGINX_RELEASE_VERSION nginx
docker push docker.pkg.github.com/squadster/squadster-api/release:$RELEASE_VERSION
