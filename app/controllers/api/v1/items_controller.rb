class Api::V1::ItemsController < ApplicationController

  def getItems
    @allItems = Item.getAllItems(params[:items])
    render json: {data: @allItems}
  end

end
