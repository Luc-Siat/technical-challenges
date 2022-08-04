require 'dotenv/load'
require 'json'
require 'open-uri'

# mapbox_key = ENV['MAPBOX_API_KEY']


# create the data and url
test_location = {
  longitude: "13.437641",
  latitude: "52.494857",
  endpoint_type: "museum",
  types: "poi"
}

# send a request to mapbox
endpoint_url = "mapbox.places/#{test_location[:endpoint_type]}.json?types=#{test_location[:types]}&proximity=#{test_location[:longitude]},#{test_location[:latitude]}&"
mapbox_url = "https://api.mapbox.com/geocoding/v5/#{endpoint_url}access_token=#{ENV['MAPBOX_API_KEY']}"
mapbox_request = URI.open(mapbox_url).read
mapbox_museum_response = JSON.parse(mapbox_request)


# fetch the name, lat, lon of the museums
endpoint_type_nearby = {}
mapbox_museum_response["features"].each do |museum|
  museum_postcode = museum["context"][0]["text"]
  museum_name = museum["text"]
  endpoint_type_nearby[museum_postcode] = museum_name
end

# get the response and translate it to json
File.open("endpoint_type_nearby.json", "wb") do |file|
  file.write(JSON.generate(endpoint_type_nearby))
end
