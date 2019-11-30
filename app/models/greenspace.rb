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

        pics = ["https://cdn.theculturetrip.com/wp-content/uploads/2017/06/img_6121-min.jpg",
"https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcRRFIeuQJo2Vpnmt3UGH0UXgLZybAQN9_yELU4SRari7K3SFC7B",
"https://pbs.twimg.com/media/DXtZy8nVQAAX11I.jpg:large",
"https://mxcity.mx/wp-content/uploads/2019/03/JA-10-750x500.jpg",
"https://mxcity.mx/wp-content/uploads/2016/07/san-angel-768x505.jpg",
"http://mexicocitystreets.com/wp-content/uploads/2013/11/david-in-rio-de-janiero.jpg",
"https://www.caye.mx/sites/default/files/styles/content/public/plaza_luis_cabrera1.jpg?itok=hy796Ffo",
"https://javiermarin.com.mx/timthumb/timthumb.php?src=https://javiermarin.com.mx/jm/wp-content/uploads/2017/07/Captura-de-pantalla-2017-07-10-a-las-4.40.45-p.m..png&w=710&zc=1&q=90",
"https://www.lahojadearena.com/wp-content/uploads/2017/05/articulo-51-escultura-de-juan-rulfo-en-banca-del-centro-de-la-blanca-comala-col.jpg",
"https://mxcity.mx/wp-content/uploads/2016/12/parque-hundido-1-768x447.jpg",
"https://www.mexicodesconocido.com.mx/wp-content/uploads/2018/12/parques_ciudad_de_m%C3%A9xico-2.jpg",
"https://www.mexicodesconocido.com.mx/wp-content/uploads/2018/12/parques_ciudad_de_m%C3%A9xico.jpg",
"https://www.mexicodesconocido.com.mx/wp-content/uploads/2018/12/parques_ciudad_de_m%C3%A9xico-1.jpg",
"https://www.mexicodesconocido.com.mx/wp-content/uploads/2018/12/parques_ciudad_de_m%C3%A9xico-4.jpg",
"https://www.dondeir.com/wp-content/uploads/2017/07/parques-para-ninos-en-cdmx-con-area-de-juegos-01.jpg",
"https://harmonia.la/imagen_nota/park.jpg",
"https://www.bosquetlalpan.org.mx/images/bosquedetlalpan02.jpg",
"https://www.mexicocity.com/media/uploads/mexicocity.com/2015/08/versions/0-chapultepec.webp"]

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
                description = green_space["fields"]["direccion"]
                picture = pics.sample

                # build the record and insert in local database
                Greenspace.create!(picture: picture, name: "#{name} - #{description}", record_id: record_id, latitude: latitude, longitude: longitude, surface: surface, perimeter: perimeter)
                puts "AREA VERDE (#{record_id}, #{latitude}, #{longitude}, #{surface}, #{perimeter})"

                counter += 1
                #Greenspace.create(record_id: record_id, lat: latitude, )
            end
        end
        puts "TOTAL RECORDS PROCESSED #{counter}"
    end
end
