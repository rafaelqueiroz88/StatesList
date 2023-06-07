# frozen_string_literal: true

module Api
  class CitiesController < ApplicationController
    include Skipable

    # api prefix: /api
    # @get: /cities
    def index
      render json: CityBlueprint.render(cities, root: :cities, view: :index),
             status: :ok
    end

    # @get: /cities/:state-slug
    def show
      render json: CityBlueprint.render(state.cities, root: :cities, view: :show),
             status: :ok
    end

    private

    def cities
      @cities ||= City.ransack(params[:q]).result || City.all
    end

    def state
      @state ||= State.find_by(slug: params[:slug]) || State.first
    end
  end
end
