class Api::V1::Manifest::InventoryitemsController < ApplicationController
  def index
    @manifestInvItems = ManifestInventoryitem.all
    render json: @manifestInvItems
  end
end
