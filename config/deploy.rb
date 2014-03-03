# bugfix for capistrano-puma
namespace :puma do
  desc 'Provision env before puma:start'
    task :fix_bug_env do
      set :rails_env, (fetch(:rails_env) || fetch(:stage))
    end

  before "puma:start", "puma:fix_bug_env"
end
