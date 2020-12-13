#!/bin/bash

# Add the docker-machine host
# Host machine setup guide: https://thobalose.co.za/2017/add-existing-host-docker-machine/#

source .env

docker-machine create --driver generic \
  --generic-ip-address $INSTANCE_IP \
  --generic-ssh-user $INSTANCE_USER \
  --generic-ssh-key ~/.ssh/id_rsa \
  $INSTANCE_NAME

docker-machine ssh $INSTANCE_NAME docker swarm init
