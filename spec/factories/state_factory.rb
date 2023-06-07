# frozen_string_literal: true

FactoryBot.define do
  factory :state, class: :state do
    name { Faker::Name.name }
  end
end
