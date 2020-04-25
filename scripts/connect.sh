#!/bin/bash

# Connect to instance via ssh

source .env

ssh -i $INSTANCE_KEY_FILE $INSTANCE_USER@$INSTANCE_IP
