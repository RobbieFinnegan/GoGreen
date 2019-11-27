class GreenspacesController < ApplicationController
  def home
  end

  def show
  end

  def index
    address = params[:query]
    unless address.blank?

      coordinates = Geocoder.search(address).first.coordinates

      @greenspaces = Greenspace.near(coordinates, 5, units: :km)
    else

      @greenspaces = Greenspace.all.first(5)
    end

      puts @greenspaces.inspect

      @markers = @greenspaces.map do |greenspace|
        {
          latitude: greenspace.latitude,
          longitude: greenspace.longitude,
          infoWindow: render_to_string(partial: "infowindow", locals: { greenspace: greenspace }),
          image_url: helpers.assets_url('REPLACE_THIS_WITH_YOUR_IMAGE_IN_ASSETS')
        }
    end
  end
end
