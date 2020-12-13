set :app_path, ENV['LOCAL_APP_PATH']

set :deploy_to, "/home/#{fetch(:user)}/#{fetch(:app_path, 'squadster')}/#{fetch(:stage)}"
set :branch, 'master'
set :keep_releases, 3

server 'localhost', roles: :app
