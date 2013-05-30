require File.expand_path('../boot', __FILE__)

require 'rails/all'

if defined?(Bundler)
  Bundler.require(*Rails.groups(:assets => %w(development test)))
end

module SkyDance
  class Application < Rails::Application
    config.encoding = "utf-8"
    config.filter_parameters += [:password]
    config.active_support.escape_html_entities_in_json = true
    config.active_record.whitelist_attributes = true
    config.assets.enabled = true
    config.assets.version = '1.0'

    config.generators do |g|
      g.template_engine :haml
      g.test_framework  :test_unit, :fixture => true, :fixture_replacement => :factory_girl
      g.stylesheets false
      g.javascripts false
    end
  end
end
