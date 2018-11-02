class Api::V1::Manifest::RacesController < ApplicationController
  def index
    @manifestRaces = ManifestRace.all
    render json: @manifestRaces
  end
end
