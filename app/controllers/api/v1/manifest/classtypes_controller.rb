class Api::V1::Manifest::ClasstypesController < ApplicationController
  def index
    @manifestClass = ManifestClass.all
    render json: @manifestClass
  end


end
