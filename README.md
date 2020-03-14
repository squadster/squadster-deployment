# Squadster deployment

This repo is for deployment latest Squadster images.<br />
It delivers files to target server and builds images from [GitHub registry](https://github.com/orgs/squadster/packages).

Check out [API repo](https://github.com/squadster/squadster-api) for more info about application.

# Usage

First of all copy default environment with `cp .env.sample .env` and configure missing values (and others if needed).<br />
After that add SSH key file. It should be named as in corresponding env variable.

Now it should be ready to go, run `./scripts/deploy.sh` to deliver compose to target instance and run application there.<br />
This script assumes that instance is running under Debian-like Linux. It'll install docker if it isn't installed.

# License

[MIT](LICENSE)
