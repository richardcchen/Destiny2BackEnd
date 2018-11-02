class Api::V1::Manifest::ItemtiertypesController < ApplicationController
  def index
    @manifestItemTierType = ManifestItemTierType.all
    render json: @manifestItemTierType
  end
end
