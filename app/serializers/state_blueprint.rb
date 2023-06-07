# frozen_string_literal: true

class StateBlueprint < Blueprinter::Base
  identifier :id

  view :index do
    fields :name, :slug
    exclude :id
  end
end
