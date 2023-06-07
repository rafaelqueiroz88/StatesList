# frozen_string_literal: true

class City < ApplicationRecord
  belongs_to :state

  before_create :slugify

  private

  def slugify
    self.slug = name.parameterize
  end
end
