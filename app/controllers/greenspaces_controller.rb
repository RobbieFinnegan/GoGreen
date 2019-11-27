class GreenspacesController < ApplicationController
  def home
  end

  def show
  end

  def index
    address = params[:query]
    if (address)
      puts address
      coordinates = Geocoder.search(address).first.coordinates
      puts coordinates.inspect #lat & lon
      @greenspaces = Greenspace.near(coordinates, 5, units: :km)
    else
      @greenspaces = Greenspace.all.first(5)
    end
    puts @greenspaces.inspect
    @markers = @greenspaces.map do |greenspace|
        {
          lat: greenspace.lat,
          lon: greenspace.lon
        }
    end
  end
end
