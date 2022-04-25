# config valid for current version and patch releases of Capistrano
lock '~> 3.11.0'

set :application, 'rerooms'
set :repo_url, 'git@github.com:mr-koww/menu.git'

set :deploy_user, 'deploy'

append :linked_dirs, 'log', 'tmp/pids', 'tmp/cache', 'tmp/sockets', 'public/system', 'public/uploads'

set :rvm_ruby_version, '2.7.2'

if ENV['BRANCH']
  set :branch, ENV['BRANCH']
else
  ask :branch, `git rev-parse --abbrev-ref HEAD`.chomp
end

set :format, :pretty

Rake::Task['puma:start'].clear_actions
namespace :puma do
  desc 'Start puma '
  task :start do
    on roles(fetch(:puma_role)) do |_role|
      execute :systemctl, '--user', 'start', fetch(:puma_service_unit_name)
    end
  end
end

Rake::Task['puma:stop'].clear_actions
namespace :puma do
  desc 'Stop puma'
  task :stop do
    on roles(fetch(:puma_role)) do |_role|
      execute :systemctl, '--user', 'stop', fetch(:puma_service_unit_name)
    end
  end
end

Rake::Task['puma:restart'].clear_actions
namespace :puma do
  desc 'Restart puma'
  task :restart do
    on roles(fetch(:puma_role)) do |_role|
      execute :systemctl, '--user', 'restart', fetch(:puma_service_unit_name)
    end
  end
end

namespace :puma do
  desc 'Status puma'
  task :status do
    on roles(fetch(:puma_role)) do |_role|
      execute :systemctl, '--user', 'status', fetch(:puma_service_unit_name)
    end
  end
end
