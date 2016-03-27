require 'simplecov'
SimpleCov.start
$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require 'kele'
require 'httparty'
require 'json'
require 'dotenv'
Dotenv.load
require 'vcr'

VCR.configure do |c|
  c.cassette_library_dir = 'spec/vcr_cassettes'
  c.hook_into :webmock
  c.allow_http_connections_when_no_cassette = true
  c.configure_rspec_metadata!
  c.default_cassette_options = {
    :match_requests_on => [:method,
      VCR.request_matchers.uri_without_param(:uid, :pass)]
  }
end

RSpec.configure do |c|
  c.around(:each, vcr: :success) do |spec|
    VCR.use_cassette("success/#{vcr_cassette}") { spec.run }
  end

  c.around(:each, vcr: :errors) do |spec|
    VCR.use_cassette("errors/#{vcr_cassette}") { spec.run }
  end
end
