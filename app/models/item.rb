class Item < ApplicationRecord
  has_many :user_items
  has_many :items, through: :user_items

  def self.getItemInfo(itemHash, bucketHash, itemInstanceId, id, system)
    invObj = ManifestInventoryitem.find_by(hashVal: itemHash)
    bucketObj  = ManifestInvBucket.find_by(hashVal: bucketHash)
    url = self.makeUrl(id, system, itemInstanceId)
    instanceObj = self.getInstanceInfo(url)
    newObj = {invObj: invObj, bucketObj: bucketObj, instanceObj: instanceObj}
    newObj
  end

  def self.getAllItems(paramsObj, id, system)
    # byebug
    finalObj = paramsObj.map do |eachObj|
      self.getItemInfo(eachObj[:itemHash], eachObj[:bucketHash], eachObj[:itemInstanceId], id, system)
    end
    finalObj
  end

  def self.getInstanceInfo(url)
    apiKey = Rails.application.credentials.api_key
    response = RestClient.get(url, headers={:"X-API-KEY" => apiKey})
    data = JSON.parse(response)
    if(data["Response"]["instance"]["data"].has_key?("primaryStat"))
      level = data["Response"]["instance"]["data"]["primaryStat"]["value"]
    else
      level = "n/a"
    end
    if (perksArray = data["Response"]["perks"].has_key?("data"))
      perksArray = data["Response"]["perks"]["data"]["perks"]
    else
      perksArray = []
    end
    instanceObj = {level: level, perksArray: perksArray}
    instanceObj
  end

  def self.makeUrl(id, system, itemInstanceId)
    # url = "https://www.bungie.net/Platform/Destiny2/2/Profile/4611686018428389623/Item/6917529040022201988/?components=300,302"
    base = "https://www.bungie.net/Platform/Destiny2"
    url = "#{base}/#{system}/Profile/#{id}/Item/#{itemInstanceId}/?components=300,302"
    url
  end

  def self.itemFilter(items)
    itemFilter = ["Chest Armor", "Leg Armor"]
    filteredArray = []
    items.each do |item|
      itemBucketName = ManifestInvBucket.find_by(hashVal: item["bucketHash"]).name
      if (itemFilter.include?(itemBucketName))
        filteredArray.push(item)
      end
    end
    byebug
  end

  # jsonClass.each do |hashVal, item|
  #   name = item["displayProperties"]["name"]
  #   ManifestGender.create({hashVal: hashVal, name: name})
  # end

end
