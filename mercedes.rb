require 'dotenv/load'
require 'json'
require 'open-uri'

# mapbox_key = ENV['MAPBOX_API_KEY']

# improve the way of sorting infos from the location, bad practice to include lat= and types=, try finding a cleaner solution

# create the data and url
test_location = {
  longitude: "13.437641",
  latitude: "52.494857",
  endpoint_type: "museum",
  types: "poi"
}
endpoint_url = "mapbox.places/#{test_location[:endpoint_type]}.json?types=#{test_location[:types]}&proximity=#{test_location[:longitude]},#{test_location[:latitude]}&"

# use mapbox
mapbox_url = "https://api.mapbox.com/geocoding/v5/#{endpoint_url}access_token=#{ENV['MAPBOX_API_KEY']}"
mapbox_request = URI.open(mapbox_url).read
mapbox_museum_response = JSON.parse(mapbox_request)
puts mapbox_museum_response

# fetch the name, lat, lon of the museums

# send a request to mapbox

# get the response and translate it to json
