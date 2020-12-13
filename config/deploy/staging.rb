set :deploy_to, "/home/#{ENV["INSTANCE_USER"]}/squadster/staging"
set :branch, 'release-staging'

server ENV['INSTANCE_IP'], user: ENV['INSTANCE_USER'], roles: %w{app}

after "deploy", "scp:env_db"
after "deploy", "docker:stack:deploy"
