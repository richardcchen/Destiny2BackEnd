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
    # itemFilter = ["Chest Armor", "Leg Armor", "Power Weapons", "Kinetic Weapons", "Class Armor", "Vehicle", "Energy Weapons", "Emote", "Helmet", "Gauntlets", "Ghost"]
    itemFilter = ["14239492", "20886954", "953998645", "1498876634", "1585787867", "2025709351", "2465295065", "3054419239", "3448274439", "3551918588", "4023194814"]
    filteredArray = []
    items.each do |item|
      if (itemFilter.include?(item["bucketHash"].to_s))
        filteredArray.push(item)
      end
    end
    filteredArray
  end

  def self.getVault(items, id, system)
    itemsFilter = ["2973005342", "3313201758", "1469714392"]
    filteredArray = []
    items.each do |item|
      if (!itemsFilter.include?(item["bucketHash"].to_s))
        filteredArray.push(item)
        # byebug
      end
    end
    finalObj = filteredArray.map do |eachObj|
      self.getVaultItemInfo(eachObj[:itemHash], eachObj[:bucketHash], eachObj[:itemInstanceId], id, system)
    end
    finalObj
  end

  def self.getVaultItemInfo(itemHash, bucketHash, itemInstanceId, id, system)
    invObj = ManifestInventoryitem.find_by(hashVal: itemHash)
    bucketObj  = ManifestInvBucket.find_by(hashVal: bucketHash)
    instanceObj = {instanceId: itemInstanceId}
    newObj = {invObj: invObj, bucketObj: bucketObj, instanceObj: instanceObj}
    newObj
  end


end #end of class
