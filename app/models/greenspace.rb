class Greenspace < ApplicationRecord

  geocoded_by :description
  after_validation :geocode
  MINIMAL_SURFACE = 5000


  def self.populate_map
    rand_records = all.sample(5)
    rand_records.map do | record |
      {:lat => record.latitude, :lng => record.longitude }

    end
  end



    def self.build_from_json
    # def self.build_from_json

        file = File.read('data/cdmx_areas_verdes_2017.json')
        data_hash = JSON.parse(file)
        counter = 0

        data_hash.each do |green_space|

          if (not green_space["fields"]["nombre"].blank?) and green_space["fields"]["geo_point_2d"] && green_space["fields"]["superficie"].to_f > MINIMAL_SURFACE
                record_id = green_space["recordid"]
                latitude = green_space["fields"]["geo_point_2d"][0]
                longitude = green_space["fields"]["geo_point_2d"][1]
                # combine if necessary
                # geolocation = [latitude, longitude]
                surface = green_space["fields"]["superficie"]
                perimeter = green_space["fields"]["perimetro"]
                name = green_space["fields"]["nombre"]
                picture = "https://cdn.theculturetrip.com/wp-content/uploads/2017/06/img_6121-min.jpg"

                # build the record and insert in local database
                Greenspace.create!(picture: picture, name: name, record_id: record_id, latitude: latitude, longitude: longitude, surface: surface, perimeter: perimeter)
                puts "AREA VERDE (#{record_id}, #{latitude}, #{longitude}, #{surface}, #{perimeter})"

                counter += 1
                #Greenspace.create(record_id: record_id, lat: latitude, )
            end
        end
        puts "TOTAL RECORDS PROCESSED #{counter}"
    end
end
