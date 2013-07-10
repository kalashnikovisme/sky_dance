require 'capi/unicorn'
require "rvm/capistrano"

set :application, "skydance"
set :rails_env,   "production"

set :rvm_type, :user

role :web, "skydance73.ru"
role :db, "skydance73.ru", :primary => true

set :user, "user"  # The server's user for deploys

set :use_sudo, false

set :rake, "#{rake} --trace"
set :app_dir, "/srv/#{application}"
  set :current_path, "#{app_dir}/current"
set :deploy_to, "#{app_dir}"

set :ssh_options, { :forward_agent => true }
default_run_options[:pty] = true

set :repository, "https://github.com/kalashnikovisme/sky_dance.git"  # Your clone URL
set :scm, "git"
set :branch, "master"
set :deploy_via, :remote_cache

desc "Seed database data"
task :seed_data do
  run "cd #{current_path} && RAILS_ENV=#{rails_env} #{rake} db:seed"
end

desc "Photos caching"
task :save_photos do
  run "cd #{current_path}/public && cp -r uploads/ #{app_dir}/shared"
end

desc "Photos restoring"
task :restore_photos do
  run "cd #{current_path}/public && cp -r #{app_dir}/shared/uploads ./"
end

namespace :db do
  desc "Symlink to sqlite db"
    task :symlink do
        run "cd #{current_path}/db && ln -s #{app_dir}/shared/db/development.sqlite3"
          end
end

namespace :bundler do
  task :install do
      run "cd #{current_path} && RAILS_ENV=#{rails_env} bundle install"
        end
end

before 'deploy:update', 'save_photos'
after 'deploy:update', 'restore_photos'
after 'deploy:create_symlink', 'db:symlink'
after 'deploy:finalize_update', 'bundler:install'
after 'deploy:migrate', 'bundler:install'

require 'capistrano_colors'

