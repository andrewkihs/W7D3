require_relative "boot"

require "rails/all"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module AspirationApp
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 6.1

    # Configuration for the application, engines, and railties goes here.
    #
    # These settings can be overridden in specific environments using the files
    # in config/environments, which are processed later.
    #
    # config.time_zone = "Central Time (US & Canada)"
    # config.eager_load_paths << Rails.root.join("extras")
    config.generators do |g|
      g.test_framework :rspec, #<-- Tells rails to use rspec for testing
        :fixtures => false, # <-- Fixtures are rails default way of creating objects for testing, we will do this ourselves.
        :view_specs => false,
        :helper_specs => false,
        :routing_specs => false,
        :controller_specs => true,
        :request_specs => false
        g.fixture_replacement :factory_bot, :dir => "spec/factories"

        # all of the other falses here are telling rails not to auto generate tests for those types of files.  We will do these manually for now, but as you grow with rails knowledge you may want to switch this to have the files get generated for you.
        # When we talk about auto-generating, I mean when we run the command `rails g model` or  `rails g controller`.  We don't need to run those commands because we already have our models and controllers, but it's good to know.

    end
  end
end
