class Api::V1::ItemsController < ApplicationController

  def getItems
    items = params[:items]
    id = params[:id]
    system = params[:system]
    filteredItems = Item.itemFilter(items)
    @allItems = Item.getAllItems(items, id, system )
    render json: {data: @allItems}
  end

end
