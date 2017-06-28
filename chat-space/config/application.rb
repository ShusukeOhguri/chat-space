require_relative 'boot'

require 'rails/all'
ActiveSupport::Deprecation.silenced = true
# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module ChatSpace
  class Application < Rails::Application
    I18n.available_locales = [:en, :ja]
    I18n.enforce_available_locales = true
    I18n.default_locale = :ja
    config.generators do |g|
      g.javascripts false
      g.helper false
      g.assets false
      g.test_framework false
      g.stylesheets false
    end
  end
end
