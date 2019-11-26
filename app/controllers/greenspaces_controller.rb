class GreenspacesController < ApplicationController
  def home

  end

  def show
  end

  def index
      @greenspaces = Greenspace.all

      @markers = @greenspaces.map do |greenspace|
        {
          lat: greenspace.latitude,
          lon: greenspace.longitude
        }
    end
  end
end
