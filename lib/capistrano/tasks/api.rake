# api service tasks
namespace :api do
  desc "runs interactive iex shell"
  task :iex do
    on roles(:app) do
      within current_path do
        run_interactively primary(:app) do
          container = '$(docker ps | grep -o "squadster_production_api.*")'
          execute 'docker', 'exec', '-it', container, 'bin/squadster', 'remote'
        end
      end
    end
  end
end
