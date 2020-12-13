server fetch(:host), user: fetch(:user), roles: :app

after "deploy", "scp:env_db"
after "deploy", "docker:stack:deploy"
