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

  def leaveComment
    itemObj = params["item"]
    comment = params["comment"]
    userObj = params["user"]
    owner = params["owner"]
    commenterMemberShipId = userObj["userInfo"]["membershipId"]
    userMembershipId = owner["userInfo"]["membershipId"]
    itemName = itemObj["invObj"]["name"]
    itemUrl = "http://www.bungie.net#{itemObj["invObj"]["screenshot"]}"
    iconUrl = "http://www.bungie.net#{itemObj["invObj"]["icon"]}"
    itemType = itemObj["invObj"]["itemTypeAndTierDisplayName"]
    commenterId = User.find_by("membershipId": commenterMemberShipId).id
    userId = User.find_by("membershipId": userMembershipId).id
    commenterName = User.find_by("membershipId": commenterMemberShipId).displayName
    Comment.create(user_id: userId, commenter_id: commenterId, itemName: itemName, itemUrl: itemUrl, itemType: itemType, commenterName: commenterName, comment: comment, iconUrl: iconUrl)
  end
end
