# config valid only for current version of Capistrano
lock '3.8.2'

# TODO Remove this line when cap -T works
#set :stage, 'production'

def deploysecret(key)
  @deploy_secrets_yml ||= YAML.load_file('config/deploy_secrets.yml')[fetch(:stage).to_s]
  @deploy_secrets_yml[key.to_s]
end

set :rails_env, fetch(:stage)
set :rvm_ruby_version, '2.3.3'
set :rvm_type, :user

set :application, 'volun_frontend'
set :server_name, deploysecret(:server_name)
set :full_app_name, fetch(:application)
# If ssh access is restricted, probably you need to use https access
#set :repo_url, 'https://perezljl:Albarracin33@bitbucket.org/volun/volun_frontend.git'
set :repo_url,  'https://perezljl:Albarracin33@bitbucket.org/volun_front/volun_frontend.git'
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
  before :deploy, "deploy:check_revision"
  after 'deploy:symlink:shared', 'deploy:compile_assets_locally'
  after :finishing, 'deploy:cleanup'
  #after :published, 'refresh_sitemap'
  after :published, 'mapeo_nas'
  after 'deploy:publishing', 'deploy:restart'

end

task :mapeo_nas do
  execute "rm -f  /aytomad/app/VOLUN/volun_frontend/shared/public/system"
  execute "ln -ds /aytomad/app/VOLUN/volun_frontend/shared/private/system /aytomad/app/VOLUN/volun_frontend/shared/public/system"
end

task :refresh_sitemap do
  on roles(:app) do
    within release_path do
      with rails_env: fetch(:rails_env) do
        execute :rake, 'sitemap:refresh:no_ping'
      end
    end
  end
end

