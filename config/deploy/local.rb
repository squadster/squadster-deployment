set :app_path, ENV['APP_PATH']
set :deploy_to, "/home/#{fetch(:user)}/#{fetch(:app_path, 'squadster')}/#{fetch(:stage)}"

server 'localhost', roles: :app
