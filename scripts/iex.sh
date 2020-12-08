#!/bin/bash

# Run iex shell on the instance

source .env

ssh -t $INSTANCE_USER@$INSTANCE_IP "docker exec -it \$(docker ps | grep -o \"squadster_production_api.*\") bin/squadster remote"
