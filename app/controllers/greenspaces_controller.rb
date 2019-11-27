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


  end
end
