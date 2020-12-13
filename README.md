# Squadster deployment

[![License](https://img.shields.io/github/license/squadster/squadster-deployment.svg)](https://github.com/squadster/squadster-deployment/blob/master/LICENSE)

This is a Squadster deployment repo.<br />
It uses Docker Swarm and Capistrano for deployment.

Check out [API repo](https://github.com/squadster/squadster-api) for more information about application and
[GitHub Registry](https://github.com/orgs/squadster/packages) for images overview.

# Usage

## Configure server

Your target instance should have Docker with initialized Swarm.<br />
You cat run `./bin/create_machine.sh` to configure docker-machine, install docker on the server and enable
the swarm mode there.

## Configure local environment

All you need to do is copy default local environment and database settings:

```bash
cp .env.sample .env.production
cp .env.sample .env.staging
cp .env.sample .env.local

cp .env.db.sample .env.db
```

Then configure missing values and it's ready to go!<br />

## Deployment

Run `cap <stage> deploy` to deliver build files to the target instance and launch/update swarm there.
Availavle stages are `production`, `staging` and `local`. The last one will run everything locally.

If you need to manually rebuild and push the nginx image use `./bin/rebuild_nginx.sh`, it will also build it on Travis.

## Access tasks

There are several tasks to simplify application access

* To connect to the instance via SSH `cap <stage> access::ssh`.
* To run iex shell on the server run `cap <stage> api:iex`.
* To connect directly to the database run `cap <stage> db:psql`.
