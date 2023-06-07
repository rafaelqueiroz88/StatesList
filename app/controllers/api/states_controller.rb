# frozen_string_literal: true

module Api
  class StatesController < ApplicationController
    include Skipable

    def index
      render json: StateBlueprint.render(states, view: :index, root: :states),
             status: :ok
    end

    private

    def states
      @states ||= State.ransack(params[:q])&.result || State.all
    end
  end
end
