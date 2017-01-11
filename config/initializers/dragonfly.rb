require 'dragonfly'

# Configure
Dragonfly.app.configure do
  plugin :imagemagick

  secret "626b2ab1143ff861bf39133e2c52d67d10e2eb16b71c3d3efe93426cf0096a48"

  url_format "/media/:job/:name"

  datastore :file,
    root_path: Rails.root.join('public/system/dragonfly'),
    server_root: Rails.root.join('public')
end

# Logger
Dragonfly.logger = Rails.logger

# Mount as middleware
Rails.application.middleware.use Dragonfly::Middleware

# Add model functionality
if defined?(ActiveRecord::Base)
  ActiveRecord::Base.extend Dragonfly::Model
  ActiveRecord::Base.extend Dragonfly::Model::Validations
end
