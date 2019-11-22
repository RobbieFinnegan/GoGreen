class Greenspace < ApplicationRecord

    MINIMAL_SURFACE = 5000

    #move this to controller
    def home
    end

    def show
    end
    ######

    def Greenspace.build_from_json
    # def self.build_from_json

        file = File.read('data/cdmx_areas_verdes_2017.json')
        data_hash = JSON.parse(file)
        counter = 0

        data_hash.each do |green_space|
        
            if green_space["fields"]["geo_point_2d"] && green_space["fields"]["superficie"].to_f > MINIMAL_SURFACE
                record_id = green_space["recordid"]
                latitude = green_space["fields"]["geo_point_2d"][0] 
                longitude = green_space["fields"]["geo_point_2d"][0]
                # combine if necessary
                # geolocation = [latitude, longitude]
                surface = green_space["fields"]["superficie"]
                perimeter = green_space["fields"]["perimetro"]

                #build the record and insert in local database
                Greenspace.create!(record_id: record_id, lat: latitude, lon: longitude, surface: surface, perimeter: perimeter)
                counter += 1
                #
                #Greenspace.create(record_id: record_id, lat: latitude, )
            end

        end

        puts "TOTAL RECORDS PROCESSED #{counter}"
    end
end
