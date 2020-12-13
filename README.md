# Squadster deployment

[![License](https://img.shields.io/github/license/squadster/squadster-deployment.svg)](https://github.com/squadster/squadster-deployment/blob/master/LICENSE)

This is a Squadster deployment repo.<br />
It uses Docker Swarm and [GitHub Registry](https://github.com/orgs/squadster/packages) for deployment.

Check out [API repo](https://github.com/squadster/squadster-api) for more info about application.

# Usage

First of all you need to run `./scripts/create_machine.sh` to configure docker-machine, install docker there and enable the swarm mode.

Then copy default local environment and database settings:

```bash
cp .env.sample .env.production
cp .env.sample .env.staging
cp .env.db.sample .env.db
```

Configure missing values and it's ready to go!<br />

## Deployment

Run `./bin/deploy.sh` to deliver build files to the target instance and launch/update swarm there.<br />
If you need to rebuild and push the nginx image use `./bin/rebuild_nginx.sh`

## Access scripts

There are several scripts to simplify application access

* To connect to the instance via SSH `./bin/s.sh`.
* To run iex shell on the server run `./bin/iex.sh`.
* To connect directly to the database run `./bin/psql.sh`.
