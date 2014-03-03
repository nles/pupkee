rails_env = ENV['RAILS_ENV'] || 'development'

threads 4,4

bind  "unix:///var/run/pupkee.sock"
pidfile "/var/www/rails/pupkee/current/tmp/puma/pid"
state_path "/var/www/rails/pupkee/current/tmp/puma/state"

activate_control_app
