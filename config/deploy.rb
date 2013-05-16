
set :application, "Studyworx3"
set :repository,  "git@github.com:tompossin/Studyworx3.git"
set :domain, "dev.studyworx.net"
set :user, 'tompossin'
set :deploy_via, :remote_cache
set :scm, 'git'
set :branch, 'master'
set :scm_verbose, true
set :rails_env, :production
set :deploy_to, "/home/tompossin/cap"
set :use_sudo,  false

default_run_options[:pty] = true

#require "rvm/capistrano"
#set :rvm_ruby_string, 'ruby-2.0.0-p195@studyworx3'
#set :rvm_type, :user

role :web, "dev.studyworx.net"                          # Your HTTP server, Apache/etc
role :app, "dev.studyworx.net"                          # This may be the same as your `Web` server
role :db,  "dev.studyworx.net", :primary => true # This is where Rails migrations will run
#role :db,  "your slave db-server here"

# if you want to clean up old releases on each deploy uncomment this:
# after "deploy:restart", "deploy:cleanup"

# if you're still using the script/reaper helper you will need
# these http://github.com/rails/irs_process_scripts

# If you are using Passenger mod_rails uncomment this:
 namespace :deploy do
   task :start do ; end
   task :stop do ; end
   task :restart, :roles => :app, :except => { :no_release => true } do
     run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
   end
 end