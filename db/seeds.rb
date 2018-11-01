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

plumbing = RestClient.get("https://destiny.plumbing/")
endpoint = JSON.parse(plumbing)["en"]["raw"]["DestinyGenderDefinition"]
response = RestClient.get(endpoint)
jsonClass = JSON.parse(response)
jsonClass.each do |hashVal, item|
  name = item["displayProperties"]["name"]
  ManifestGender.create({hashVal: hashVal, name: name})
end
