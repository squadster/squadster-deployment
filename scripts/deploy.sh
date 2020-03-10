#!/bin/bash

source .env

echo $GITHUB_TOKEN | docker login -u $GITHUB_USER --password-stdin docker.pkg.github.com
docker-compose up
