# frozen_string_literal: true

class CityBlueprint < Blueprinter::Base
  identifier :id

  view :index do
    fields :name, :slug
    exclude :id
  end

  view :show do
    include_view :index
    fields :state_id
  end
end
