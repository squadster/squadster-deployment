server fetch(:host), user: fetch(:user), roles: :app

after "deploy", "upload:env_db"
after "deploy", "docker:stack:deploy"
