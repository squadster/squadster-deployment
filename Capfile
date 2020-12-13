require "capistrano/setup"
require "capistrano/deploy"
require "capistrano/scm/git"

require 'sshkit/interactive'
require 'dotenv'

# Load custom tasks from `lib/capistrano/tasks`
Dir.glob("lib/capistrano/tasks/*.rake").each { |task| import task }

install_plugin Capistrano::SCM::Git
