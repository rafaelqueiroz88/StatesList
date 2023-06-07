# frozen_string_literal: true

FactoryBot.define do
  factory :city, class: :city do
    name { Faker::Name.name }
    state { create(:state) }
  end
end
