# frozen_string_literal: true

ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../config/environment', __dir__)
abort('The Rails environment is running in production mode!') if Rails.env.production?
require 'rspec/rails'
require 'spec_helper'
require 'factory_bot'
require 'capybara/rspec'
require 'database_cleaner/active_record'
require 'blueprinter'

Dir[Rails.root.join('spec', 'support', '**', '*.rb')].each { |f| require f }
Dir[Rails.root.join('spec', 'factories', '**', '*.rb')].each { |f| require f }

begin
  ActiveRecord::Migration.maintain_test_schema!
rescue ActiveRecord::PendingMigrationError => e
  puts e.to_s.strip
  exit 1
end

RSpec.configure do |config|
  config.include Rails.application.routes.url_helpers

  config.before(:suite) do
    DatabaseCleaner.clean_with(:truncation) if Rails.env.test?
  end

  config.before(:each) do
    DatabaseCleaner.strategy = :transaction if Rails.env.test?
  end

  config.before('each', 'js' => true) do
    DatabaseCleaner.strategy = :truncation if Rails.env.test?
  end

  config.before(:each) do
    DatabaseCleaner.start if Rails.env.test?
  end

  config.after(:each) do
    DatabaseCleaner.clean if Rails.env.test?
  end

  config.fixture_path = "#{Rails.root}/spec/fixtures"
  config.use_transactional_fixtures = true
  config.infer_spec_type_from_file_location!
  config.filter_rails_from_backtrace!
end
