server_name = '62.84.121.46'

server server_name, user: 'deploy', roles: %w[app db web], primary: true

role :app, server_name
role :web, server_name
role :db,  server_name

set :rails_env, :production
set :stage, :production

append :linked_files, 'config/database.yml'
set :deploy_to, "/home/#{fetch(:deploy_user)}/rerooms"

# Override capistrano-puma tasks (for systemd)
set :puma_service_unit_name, "#{fetch(:application)}.service"
