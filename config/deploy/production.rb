set :deploy_to, "/home/#{ENV["INSTANCE_USER"]}/squadster/production"
set :branch, 'master'

server ENV['INSTANCE_IP'], user: ENV['INSTANCE_USER'], roles: %w{app}

after "deploy", "scp:env_db"
after "deploy", "docker:stack:deploy"
