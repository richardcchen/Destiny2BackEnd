class Api::V1::Manifest::PerksController < ApplicationController
  def index
    @manifestPerks = ManifestPerk.all
    render json: @manifestPerks
  end
end
