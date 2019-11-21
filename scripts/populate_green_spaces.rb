#!/urs/bin/env ruby
require_relative "../config/environment"

file = File.read('data/cdmx_areas_verdes_2017.json')
data_hash = JSON.parse(file)
counter = 0

data_hash.each do |green_space|
  
  if green_space["fields"]["geo_point_2d"]
    record_id = green_space["recordid"]
    latitude = green_space["fields"]["geo_point_2d"][0] 
    longitude = green_space["fields"]["geo_point_2d"][0]
    # combine if necessary
    # geolocation = [latitude, longitude]
    surface = green_space["fields"]["superficie"]
    perimeter = green_space["fields"]["perimetro"]

    #build the record and insert in local database
    puts "AREA VERDE (#{record_id}, #{latitude}, #{longitude}, #{surface}, #{perimeter})"
    counter += 1
    #
    #Greenspace.create(record_id: record_id, lat: latitude, )
  end

  puts "TOTAL RECORDS PROCESSED #{counter}"

end
