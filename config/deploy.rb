# config valid only for current version of Capistrano
lock '3.5.0'

puts "------------------------- YAML.load_file('config/deploy-secrets.yml') #{YAML.load_file('config/deploy-secrets.yml')}"

def deploysecret(key)
  puts "++++++++++++++++++++++++++ fetch(:stage) #{fetch(:stage).inspect}"
  @deploy_secrets_yml ||= YAML.load_file('config/deploy-secrets.yml')[fetch(:stage).to_s]
  puts "++++++++++++++++++++++++++ @deploy_secrets_yml #{@deploy_secrets_yml.inspect}"
  @deploy_secrets_yml[key.to_s]
end

set :rails_env, fetch(:stage)
set :rvm_ruby_version, '2.2.2'
set :rvm_type, :user

set :application, 'volun_frontend'
set :server_name, deploysecret(:server_name)
set :full_app_name, fetch(:application)
# If ssh access is restricted, probably you need to use https access
set :repo_url, 'https://github.com/volunt/volun_frontend.git'

set :scm, :git
set :revision, `git rev-parse --short #{fetch(:branch)}`.strip

set :log_level, :info
set :pty, true
set :use_sudo, false

set :linked_files, %w{config/database.yml config/secrets.yml}
set :linked_dirs, %w{log tmp public/system public/assets}

set :keep_releases, 10

set :local_user, ENV['USER']

# Run test before deploy
set :tests, ["spec"]

# Config files should be copied by deploy:setup_config
set(:config_files, %w(
  log_rotation
  database.yml
  secrets.yml
  unicorn.rb
))


namespace :deploy do
  # Check right version of deploy branch
  before :deploy, "deploy:check_revision"
  # Run test aund continue only if passed
  # before :deploy, "deploy:run_tests"
  # Compile assets locally and then rsync
  after 'deploy:symlink:shared', 'deploy:compile_assets_locally'
  after :finishing, 'deploy:cleanup'
  # Restart unicorn
  after 'deploy:publishing', 'deploy:restart'
  # after 'deploy:restart', 'sidekiq:restart'
end

