#!/bin/bash

# Deploy application from the github registry to the target instance

# execute command on server
execute() {
  docker-machine ssh $INSTANCE_NAME $@
}

# send file to app directory
transfer() {
  docker-machine scp --recursive $1 $INSTANCE_NAME:$2
}

source .env

app_dir=squadster/$APP_ENV

execute "mkdir -p $app_dir"
execute "chmod 777 $app_dir"
transfer docker-compose.yml $app_dir
transfer .env.db $app_dir
transfer nginx $app_dir

execute "echo $GITHUB_TOKEN | docker login -u $GITHUB_USER --password-stdin docker.pkg.github.com"
execute "cd $app_dir && docker stack deploy --compose-file=docker-compose.yml --with-registry-auth squadster_${APP_ENV}"
