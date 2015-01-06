require File.expand_path('../boot', __FILE__)

require 'rails/all'

# Require the cems listed in cemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module ReedPortfolio
  class Application < Rails::Application
    config.generators do |c|
      c.stylesheets false
      c.javascripts false
      c.helper false
      c.test_framework false
    end
  end
end
