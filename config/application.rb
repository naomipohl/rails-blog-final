require_relative 'boot'

require 'rails/all'

Bundler.require(*Rails.groups)

module Blog2
  class Application < Rails::Application
    config.load_defaults 5.1
    config.assets.initialize_on_precompile = false
  end
end
