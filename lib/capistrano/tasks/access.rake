namespace :access do
  namespace :upload do
    desc 'Upload .env.db to the release directory'
    task :env_db do
      on roles(:app) do
        upload!('.env.db', "#{release_path}/.env.db")
      end
    end
  end

  desc 'Connect to the instance'
  task :ssh do
    on roles(:app) do
      within current_path do
        run_interactively primary(:app) do
          execute :bash
        end
      end
    end
  end

  desc "Check the access to deploy directory"
  task :check_write_permissions do
    on roles(:all) do |host|
      if test("[ -w #{fetch(:deploy_to)} ]")
        info "#{fetch(:deploy_to)} is writable on #{host}"
      else
        error "#{fetch(:deploy_to)} is not writable on #{host}"
      end
    end
  end
end
