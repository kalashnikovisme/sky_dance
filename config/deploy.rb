require 'capi/unicorn'
require "rvm/capistrano"

set :application, "skydance"
set :rails_env,   "production"

set :rvm_type, :user

role :web, "skydance73.ru"
role :db, "skydance73.ru", primary: true

set :user, "skydance"  # The server's user for deploys

set :use_sudo, false

set :rake, "#{rake} --trace"
set :app_dir, "/srv/#{application}"
  set :current_path, "#{app_dir}/current"
set :deploy_to, "#{app_dir}"

set :ssh_options, { forward_agent: true }
default_run_options[:pty] = true

timestamp = Time.now.utc.strftime("%Y%m%d%H%M%S")

set :repository, "https://github.com/kalashnikovisme/sky_dance.git"  # Your clone URL
set :scm, "git"
set :branch, "master"
set :deploy_via, :remote_cache


namespace :files do
	desc "Files backup"
	task :backup do
	  run "mkdir #{app_dir}/shared/backup/uploads/#{timestamp} && cp -rf #{app_dir}/shared/uploads/* #{app_dir}/shared/backup/uploads/#{timestamp}/ && rm #{app_dir}/shared/uploads && ln -sf #{app_dir}/shared/backup/uploads/#{timestamp} #{app_dir}/shared/uploads"
	end

	desc "Restore link to uploads"
	task :link_update do
		run "rm -rf #{current_path}/public/uploads && cp -Pf #{app_dir}/shared/uploads #{current_path}/public/uploads"
	end
end


namespace :db do
  desc "Backup database"
  task :backup do
  	run "pg_dump skydance >  #{app_dir}/shared/backup/db/#{timestamp}_dump.sql"
  end

  desc "Seed database data"
	task :seed do
	  run "cd #{current_path} && RAILS_ENV=#{rails_env} #{rake} db:seed"
  end
end

namespace :bundler do
  desc "Run 'bundle install'"
  task :install do
 		run "cd #{current_path} && RAILS_ENV=#{rails_env} bundle install"
  end
end

namespace :assets do
	desc "Run 'rake assets:clean'"
	task :clean do
		run "cd #{current_path} && RAILS_ENV=#{rails_env} rake assets:clean"
	end

	desc "Run 'rake assets:precompile'"
	task :precompile do
		run "cd #{current_path} && RAILS_ENV=#{rails_env} rake assets:precompile"
	end

end

before 'deploy:update', 'unicorn:stop', "files:backup", "db:backup"
after 'deploy:finalize_update', 'bundler:install'
after 'deploy:update', 'assets:precompile', 'files:link_update', 'unicorn:start'

before 'assets:precompile', 'assets:clean'
after 'deploy:migrate', 'bundler:install'

require 'capistrano_colors'

