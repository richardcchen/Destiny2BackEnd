class Item < ApplicationRecord
  has_many :user_items
  has_many :items, through: :user_items

  def self.getItemInfo(itemHash, bucketHash)
    invObj = ManifestInventoryitem.find_by(hashVal: itemHash)
    bucketObj  = ManifestInvBucket.find_by(hashVal: bucketHash)
    newObj = {invObj: invObj, bucketObj: bucketObj}
    newObj
  end

  def self.getAllItems(paramsObj)
    finalObj = paramsObj.map do |eachObj|
      self.getItemInfo(eachObj[:itemHash], eachObj[:bucketHash])
    end
    finalObj
  end
end
