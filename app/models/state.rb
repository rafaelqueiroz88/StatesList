# frozen_string_literal: true

class State < ApplicationRecord
  has_many :cities

  before_create :slugify

  private

  def slugify
    self.slug = name.parameterize
  end
end
