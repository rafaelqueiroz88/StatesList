# frozen_string_literal: true

module Skipable
  extend ActiveSupport::Concern

  included do
    protect_from_forgery with: :null_session unless Rails.env.test?
  end
end
