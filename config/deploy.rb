lock "~> 3.14.1"

# use local env for stage independent tasks like `cap -T`
postfix = fetch(:stage).empty? ? 'local' : fetch(:stage)
Dotenv.load(".env.#{postfix}")
Dotenv.load(".env.db")

set :application, "squadster"
set :repo_url, "https://github.com/squadster/squadster-deployment"
set :keep_releases, 5

set :host, ENV['INSTANCE_IP']
set :user, ENV['INSTANCE_USER']
set :postgres_db, ENV['POSTGRES_DB']
set :postgres_user, ENV['POSTGRES_USER']

set :deploy_to, "/home/#{fetch(:user)}/squadster/#{fetch(:stage)}"
set :branch, 'release'

server fetch(:host), user: fetch(:user), roles: :app

before "deploy", "access:check_write_permissions"

after "deploy", "access:upload:env_db"
after "deploy", "docker:stack:deploy"
