#!/bin/bash

# This script runs iex shell on the instance

source .env

ssh -t $INSTANCE_USER@$INSTANCE_IP "docker exec -it \$(docker ps | grep -o \"production_api_.*\") bin/squadster remote"
