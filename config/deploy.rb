lock "~> 3.14.1"

Dotenv.load(".env.#{fetch(:stage)}")

set :application, "squadster"
set :repo_url, "https://github.com/squadster/squadster-deployment"
set :keep_releases, 3

set :host, ENV['INSTANCE_IP']
set :user, ENV['INSTANCE_USER']

set :deploy_to, "/home/#{fetch(:user)}/squadster/#{fetch(:stage)}"
set :branch, 'release'
