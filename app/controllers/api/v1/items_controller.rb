class Api::V1::ItemsController < ApplicationController

  def getItems
    @allItems = Item.getAllItems(params[:items])
    response = params["membershipId"]
    # @membershipId = JSON.parse(response)
    render json: {data: @allItems}
  end

end
