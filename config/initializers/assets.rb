# Be sure to restart your server when you modify this file.

# Version of your assets, change this if you want to expire all your assets.
Rails.application.config.assets.version = '1.0'

# Add additional assets to the asset load path
# Rails.application.config.assets.paths << 'images'

# Precompile additional assets.
# application.js, application.css, and all non-JS/CSS in app/assets folder are already added.
# Rails.application.config.assets.precompile += %w( search.js )
Rails.application.config.assets.precompile += %w( projects.js )
Rails.application.config.assets.precompile += %w( address.js )
Rails.application.config.assets.precompile += %w( activities.js )
Rails.application.config.assets.precompile += %w( activities_home.js )
Rails.application.config.assets.precompile += %w( activities_show.js )
Rails.application.config.assets.precompile += %w( project_show.js )
Rails.application.config.assets.precompile += %w( jquery.dotdotdot.min.js )
Rails.application.config.assets.precompile += %w( js/locale/i18n_es.js )
Rails.application.config.assets.precompile += %w( js/vendor.js )
Rails.application.config.assets.precompile += %w( js/ayuntamiento-madrid.js )

