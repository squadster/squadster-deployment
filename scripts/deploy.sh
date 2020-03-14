#!/bin/bash

execute() {
  ssh -i squadster.pem $INSTANCE_USER@$INSTANCE_IP -T $@
}

transfer() {
  scp -r -i squadster.pem $1 $INSTANCE_USER@$INSTANCE_IP:$2
}

source .env

app_dir=squadster/$APP_ENV

execute "mkdir -p $app_dir"
execute "chmod 777 $app_dir"
transfer docker-compose.yml $app_dir
transfer .env $app_dir
transfer nginx $app_dir

execute "
  if [[ ! \$(which docker | grep -o docker) ]]; then
    echo \"No docker found installing...\"

    sudo apt-get update;
    sudo apt-get install -y apt-transport-https ca-certificates curl gnupg-agent software-properties-common;
    curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -;
    sudo add-apt-repository \"deb [arch=amd64] https://download.docker.com/linux/ubuntu \$(lsb_release -cs) stable\";
    sudo apt-get update -y;
    sudo apt-get install -y docker-ce docker-ce-cli containerd.io;
    sudo usermod -aG docker $INSTANCE_USER
  fi
"

execute "
  if [[ ! \$(which docker-compose | grep -o docker-compose) ]]; then
    echo \"No docker-compose found installing...\"

    sudo curl -L \"https://github.com/docker/compose/releases/download/1.25.4/docker-compose-\$(uname -s)-\$(uname -m)\" -o /usr/local/bin/docker-compose;
    sudo chmod +x /usr/local/bin/docker-compose;
  fi
"

execute "echo $GITHUB_TOKEN | docker login -u $GITHUB_USER --password-stdin docker.pkg.github.com"
execute "cd $app_dir && docker-compose down && docker-compose build --parallel --pull && docker-compose up -d --force-recreate"
