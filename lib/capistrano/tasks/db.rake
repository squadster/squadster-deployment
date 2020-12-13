# db service tasks
namespace :db do
  desc "connects directly to database"
  task :psql do
    on roles(:app) do
      within current_path do
        run_interactively primary(:app) do
          container = '$(docker ps | grep -o "squadster_production_db.*")'
          execute 'docker', 'exec', '-it', container, 'psql', '-U', fetch(:postgres_user), '-d', fetch(:postgres_db)
        end
      end
    end
  end
end
