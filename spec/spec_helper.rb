# frozen_string_literal: true

require 'securerandom'

RSpec.configure do |config|
  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end

  config.shared_context_metadata_behavior = :apply_to_host_groups

  def json_response
    JSON.parse(response.body)
  end

  def symbol_response
    json_response.symbolize_keys
  end

  def symbol_response_root(root)
    json_response.symbolize_keys[root.to_sym]
  end
end
