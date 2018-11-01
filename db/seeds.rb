# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# plumbing = RestClient.get("https://destiny.plumbing/")
# endpoint = JSON.parse(plumbing)["en"]["raw"]["DestinyRaceDefinition"]
# response = RestClient.get(endpoint)
# jsonClass = JSON.parse(response)
# jsonClass.each do |hashVal, item|
#   name = item["displayProperties"]["name"]
#   description = item["displayProperties"]["description"]
#   ManifestRace.create({hashVal: hashVal, name: name, description: description})
# end
#
# plumbing = RestClient.get("https://destiny.plumbing/")
# endpoint = JSON.parse(plumbing)["en"]["raw"]["DestinyGenderDefinition"]
# response = RestClient.get(endpoint)
# jsonClass = JSON.parse(response)
# jsonClass.each do |hashVal, item|
#   name = item["displayProperties"]["name"]
#   ManifestGender.create({hashVal: hashVal, name: name})
# end
#
# plumbing = RestClient.get("https://destiny.plumbing/")
# endpoint = JSON.parse(plumbing)["en"]["raw"]["DestinyClassDefinition"]
# response = RestClient.get(endpoint)
# jsonClass = JSON.parse(response)
# jsonClass.each do |hashVal, item|
#   name = item["displayProperties"]["name"]
#   p name
#   ManifestClass.create({hashVal: hashVal, name: name})
# end

# ManifestInventoryitem.destroy_all
#
# plumbing = RestClient.get("https://destiny.plumbing/")
# endpoint = JSON.parse(plumbing)["en"]["raw"]["DestinyInventoryItemDefinition"]
# response = RestClient.get(endpoint)
# jsonClass = JSON.parse(response)
#
# jsonClass.each do |hashVal, item|
#   name = item["displayProperties"]["name"]
#   description = item["displayProperties"]["description"]
#   icon = item["displayProperties"]["icon"]
#   screenshot = item["screenshot"]
#   itemTypeDisplayName = item["itemTypeDisplayName"]
#   itemTypeAndTierDisplayName = item["itemTypeAndTierDisplayName"]
#   tierTypeHash = item["inventory"]["tierTypeHash"]
#   recoveryBucketTypeHash = item["inventory"]["recoveryBucketTypeHash"]
#   isInstanceItem = item["inventory"]["isInstanceItem"]
#
#   ManifestInventoryitem.create(
#     hashVal: hashVal,
#     name: name,
#     description: description,
#     icon: icon,
#     screenshot: screenshot,
#     itemTypeDisplayName: itemTypeDisplayName,
#     itemTypeAndTierDisplayName: itemTypeAndTierDisplayName,
#     tierTypeHash: tierTypeHash,
#     recoveryBucketTypeHash: recoveryBucketTypeHash,
#     isInstanceItem: isInstanceItem
#     )
#     id = ManifestInventoryitem.last.id
#     if item["stats"]
#       allStats = item["stats"]["stats"]
#       allStats.each do |hash, stat|
#         stat = Stat.create(hashVal: hash, value: stat["value"], min: stat["minimum"], max: stat["maximum"], manifest_inventoryitem_id: id)
#       end
#     end
# end

# plumbing = RestClient.get("https://destiny.plumbing/")
# endpoint = JSON.parse(plumbing)["en"]["raw"]["DestinyItemTierTypeDefinition"]
# response = RestClient.get(endpoint)
# jsonClass = JSON.parse(response)
# jsonClass.each do |hashVal, item|
#   name = item["displayProperties"]["name"]
#   ManifestItemTierType.create(hashVal: hashVal, name: name)
# end

# plumbing = RestClient.get("https://destiny.plumbing/")
# endpoint = JSON.parse(plumbing)["en"]["raw"]["DestinyStatDefinition"]
# response = RestClient.get(endpoint)
# jsonClass = JSON.parse(response)
# jsonClass.each do |hashVal, item|
#   name = item["displayProperties"]["name"]
#   description = item["displayProperties"]["description"]
#   ManifestStat.create(hashVal: hashVal, name: name, description: description)
# end

# plumbing = RestClient.get("https://destiny.plumbing/")
# endpoint = JSON.parse(plumbing)["en"]["raw"]["DestinySandboxPerkDefinition"]
# response = RestClient.get(endpoint)
# jsonClass = JSON.parse(response)
# jsonClass.each do |hashVal, item|
#   name = item["displayProperties"]["name"]
#   description = item["displayProperties"]["description"]
#   icon = item["displayProperties"]["icon"]
#   ManifestPerk.create(hashVal: hashVal, name: name, description: description, icon: icon)
# end

plumbing = RestClient.get("https://destiny.plumbing/")
endpoint = JSON.parse(plumbing)["en"]["raw"]["DestinyDamageTypeDefinition"]
response = RestClient.get(endpoint)
jsonClass = JSON.parse(response)
jsonClass.each do |hashVal, item|
  name = item["displayProperties"]["name"]
  description = item["displayProperties"]["description"]
  icon = item["displayProperties"]["icon"]
  icontrans = item["transparentIconPath"]
  ManifestDamageType.create(hashVal: hashVal, name: name, description: description, icon: icon, icontrans: icontrans)
end
