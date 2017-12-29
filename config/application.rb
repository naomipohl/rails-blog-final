require_relative 'boot'

require 'rails/all'

Bundler.require(*Rails.groups)

module Blog2
  class Application < Rails::Application
    config.load_defaults 5.1
    config.assets.initialize_on_precompile = false
    config.assets.enabled = true
    config.assets.precompile += Ckeditor.assets
	config.assets.precompile += %w(ckeditor/*)
	config.autoload_paths += %W(#{config.root}/app/models/ckeditor)
  end
end
