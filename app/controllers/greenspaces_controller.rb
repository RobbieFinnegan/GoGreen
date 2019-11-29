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

    @greenspaces_json = @greenspaces.map do |greenspace|
      {:lat => greenspace.latitude, :lng => greenspace.longitude, :name => greenspace.name }
    end

  end

end
