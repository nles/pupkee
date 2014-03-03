set :rvm_type, :system
#set :default_env, { rvm_bin_path: '/usr/local/rvm/bin' }
# Extended Server Syntax
# ======================
set :domain, "pupkee.ymme.info"
set :user, "deploy"
server fetch(:domain), user: fetch(:user), roles: %w{web app db}

#========================
#CONFIG
#========================
set :application, 'pupkee'
set :scm, :git
set :repo_url, 'git@github.com:nles/pupkee.git'
set :branch, "master"
set :ssh_options, { :forward_agent => true }
set :runner, "deploy"
set :deploy_to, "/var/www/rails/#{fetch(:application)}"
set :app_server, :puma
#========================
#ROLES
#========================
role :app, fetch(:domain)
role :web, fetch(:domain)
role :db, fetch(:domain), :primary => true
