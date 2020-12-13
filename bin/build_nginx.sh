#!/bin/bash

# Rebuild nginx image and push it to the registry

if test -f ".env"; then
  source .env
fi

echo $GITHUB_TOKEN | docker login -u $GITHUB_USER --password-stdin docker.pkg.github.com

docker build -t docker.pkg.github.com/squadster/squadster-deployment/nginx:$RELEASE_VERSION nginx
docker push docker.pkg.github.com/squadster/squadster-deployment/nginx:$RELEASE_VERSION
