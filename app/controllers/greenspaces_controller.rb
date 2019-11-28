class GreenspacesController < ApplicationController
  def home
  end

  def show
  end

  def index
    address = params[:query]
    unless address.blank?

      coordinates = Geocoder.search(address).first.coordinates

      @greenspaces = Greenspace.near(coordinates, 1, units: :km).to_a
    else

      @greenspaces = Greenspace.all.first(5).to_a
    end
      @greenspaces.map! do |greenspace|
          {:lat => greenspace.latitude, :lng => greenspace.longitude }
        end

      @greenspaces << {
        :lat => coordinates[0],
        :lng => coordinates[1],
        image_url: "https://st4.depositphotos.com/18673546/21459/v/1600/depositphotos_214595286-stock-illustration-pin-vector-icon-isolated-transparent.jpg"
      }



  end

end
