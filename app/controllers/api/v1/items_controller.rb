class Api::V1::ItemsController < ApplicationController

  def getItems
    items = params[:items]
    id = params[:id]
    system = params[:system]
    filteredItems = Item.itemFilter(items)
    @allItems = Item.getAllItems(filteredItems, id, system )
    render json: {data: @allItems}
  end

  def getVault
    items = params[:items]
    id = params[:id]
    system = params[:system]
    @vault = Item.getVault(items, id, system)
    render json: {data: @vault}
  end
end
