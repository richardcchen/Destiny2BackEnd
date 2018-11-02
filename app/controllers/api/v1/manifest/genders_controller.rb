class Api::V1::Manifest::GendersController < ApplicationController
  def index
    @manifestGender = ManifestGender.all
    render json: @manifestGender
  end
end
