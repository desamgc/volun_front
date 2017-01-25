require File.expand_path('../boot', __FILE__)

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module VolunFrontend
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

    config.i18n.available_locales = [:en, :es]

    config.i18n.default_locale = :es

    # Add the new directories to the locales load path
    config.i18n.load_path += Dir[Rails.root.join('config', 'locales', '**', '*.{rb,yml}')]

    config.assets.paths << Rails.root.join("app", "assets", "fonts", "images")

    # Add lib to the autoload path
    config.autoload_paths << Rails.root.join('lib')
    config.time_zone = 'Madrid'
    # Do not swallow errors in after_commit/after_rollback callbacks.
    config.active_record.raise_in_transactional_callbacks = true

    config.active_record.schema_format = :sql

    config.generators do |g|
      g.test_framework :rspec,
                       fixtures:         true,
                       view_specs:       false,
                       helper_specs:     false,
                       routing_specs:    false,
                       request_specs:    false,
                       jbuilder:         false
      g.fixture_replacement :factory_girl, dir: 'spec/factories'
      g.helper            false
      g.assets            false
      g.view_specs        false
      g.jbuilder          false
    end
  end
end
