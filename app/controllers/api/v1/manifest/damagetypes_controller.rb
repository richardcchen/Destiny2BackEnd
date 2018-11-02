class Api::V1::Manifest::DamagetypesController < ApplicationController
  def index
    @manifestDmgType = ManifestDamageType.all
    render json: @manifestDmgType
  end
end
