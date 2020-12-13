#!/bin/bash

# Connect directly to the database on the instance

source .env
source .env.db

ssh -t $INSTANCE_USER@$INSTANCE_IP "docker exec -it \$(docker ps | grep -o \"squadster_production_db.*\") psql -U $POSTGRES_USER -d $POSTGRES_DB"
