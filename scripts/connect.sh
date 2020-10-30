#!/bin/bash

# Connect to instance via ssh

source .env

ssh $INSTANCE_USER@$INSTANCE_IP
