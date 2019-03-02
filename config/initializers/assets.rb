# frozen_string_literal: true

# Be sure to restart your server when you modify this file.

# Version of your stylesheets, change this if you want to expire all your stylesheets.
Rails.application.config.assets.version = '1.0'

# Add additional stylesheets to the asset load path.
# Rails.application.config.stylesheets.paths << Emoji.images_path
# Add Yarn node_modules folder to the asset load path.
Rails.application.config.assets.paths << Rails.root.join('node_modules')

# Precompile additional stylesheets.
# application.js, application.css, and all non-JS/CSS in the app/stylesheets
# folder are already added.

# /app/assets
Rails.application.config.assets.precompile += %w[
  admins_backoffice.js
  admins_backoffice.css
  users_backoffice.js
  users_backoffice.css
]

# /lib/assets
Rails.application.config.assets.precompile += %w[
  sb-admin-2.js
  sb-admin-2.css
  custom.js
  custom.css
  img.jpg
]

# /vendor/assets
Rails.application.config.assets.precompile += %w[
  jquery-2-2-3/dist/jquery.js
]
