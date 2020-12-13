namespace :docker do
  namespace :stack do
    desc "creates or updates a Swarm stack"
    task :deploy do
      on roles(:all) do
        within release_path do
          execute :docker, 'stack', 'deploy', "squadster_#{fetch(:stage)}", '--compose-file=docker-compose.yml'
        end
      end
    end
  end
end
