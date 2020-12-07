#!/bin/bash

# Connect to instance via ssh

source .env

docker-machine ssh $INSTANCE_NAME
