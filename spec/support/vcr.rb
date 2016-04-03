require 'vcr'

VCR.configure do |c|
  c.cassette_library_dir = 'spec/vcr_cassettes'
  c.hook_into :webmock
  c.filter_sensitive_data('<EMAIL>') { URI.encode_www_form_component ENV['EMAIL'] }
  c.filter_sensitive_data('<PASSWORD>') { URI.encode_www_form_component ENV['PASSWORD'] }
  c.filter_sensitive_data('<MENTOR_ID>') { ENV['MENTOR_ID'] }
  c.filter_sensitive_data('<ROADMAP_ID>') { ENV['ROADMAP_ID'] }
  c.filter_sensitive_data('<CHECKPOINT_ID>') { ENV['CHECKPOINT_ID'] }
  c.filter_sensitive_data('<PAGE_ID>') { ENV['PAGE_ID'] }
  c.default_cassette_options = {record: :new_episodes}
  c.configure_rspec_metadata!
end
