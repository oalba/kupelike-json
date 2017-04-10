# Be sure to restart your server when you modify this file.

# Version of your assets, change this if you want to expire all your assets.
Rails.application.config.assets.version = '1.0'

# Add additional assets to the asset load path
# Rails.application.config.assets.paths << Emoji.images_path

# Precompile additional assets.
# application.js, application.css, and all non-JS/CSS in app/assets folder are already added.
# Rails.application.config.assets.precompile += %w( search.js )
# Rails.application.config.assets.precompile += %w( estilo.css )
# Rails.application.config.assets.precompile += %w( bootstrap.min.css )
# Rails.application.config.assets.precompile += %w( font-awesome.min.css )
# Rails.application.config.assets.precompile += %w( jquery.min.js )
# Rails.application.config.assets.precompile += %w( bootstrap.min.js )
# Rails.application.config.assets.precompile += %w( script.js )
# Rails.application.config.assets.precompile += %w( favicon.ico )
Rails.application.config.assets.precompile += ['*.js', '*.css', '**/*.js', '**/*.css', '*.woff2', '**/*.woff2']
Rails.application.config.assets.precompile += ['estilo.css', 'bootstrap.min.css', 'font-awesome.min.css', 'jquery.min.js', 'bootstrap.min.js', 'script.js', 'favicon.ico', 'estadisticas.min.js', 'glyphicons-halflings-regular.woff2']