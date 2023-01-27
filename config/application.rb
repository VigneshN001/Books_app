
require_relative 'boot'

require 'rails/all'

Bundler.require(*Rails.groups)

module API
class Application < Rails::Application

    config.load_defaults 7.0
    config.autoloader = :Zeitwerk
    #config.paths.add File.join('app', 'api'), glob: File.join('**', '*.rb')
    #config.autoload_paths += Dir[Rails.root.join('app', 'api', '*')]
    
  end
end