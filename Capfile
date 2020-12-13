require "capistrano/setup"
require "capistrano/deploy"
require "capistrano/scm/git"

install_plugin Capistrano::SCM::Git

require 'dotenv'

Dotenv.load

# Load custom tasks from `lib/capistrano/tasks`
Dir.glob("lib/capistrano/tasks/*.rake").each { |task| import task }
