namespace :scp do
  desc "Uploads .env.db to the release directory"
  task :env_db do
    on roles(:all) do
      upload!('.env.db', "#{release_path}/.env.db")
    end
  end
end
