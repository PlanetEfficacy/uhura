ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
abort("The Rails environment is running in production mode!") if Rails.env.production?
require 'spec_helper'
require 'rspec/rails'
require 'capybara/rails'
require 'vcr'

Shoulda::Matchers.configure do |config|
  config.integrate do |with|
    with.test_framework :rspec
    with.library :rails
  end
end

Dir[Rails.root.join('spec/support/**/*.rb')].each { |f| require f }

ActiveRecord::Migration.maintain_test_schema!

RSpec.configure do |config|
  config.fixture_path = "#{::Rails.root}/spec/fixtures"
  config.use_transactional_fixtures = false
  config.infer_spec_type_from_file_location!
  config.filter_rails_from_backtrace!
  config.formatter = :documentation
end

VCR.configure do |config|
  config.allow_http_connections_when_no_cassette = true
  config.cassette_library_dir = "spec/vcr_cassettes"
  config.hook_into :webmock
end

def stub_omniauth
  OmniAuth.config.test_mode = true
  OmniAuth.config.mock_auth[:google] = OmniAuth::AuthHash.new({
    provider: "google",
    uid: "111170661645334345595",
    info: {
      name: "Jesse Spevack",
      email: "jspevack@gmail.com",
      first_name: "Jesse",
      last_name: "Spevack",
      image: "https://lh3.googleusercontent.com/-ZI4ojL91GxA/AAAAAAAAAAI/AAAAAAAAGVo/1F5PGMtlgHI/s50-c/photo.jpg",
      urls: "https://plus.google.com/111170661645334345595"
    },
    credentials: {
      token: "my_token",
      refresh_token: "another_token",
      expires_at: "1477945241",
      expires: "true"
    }
  })
end
