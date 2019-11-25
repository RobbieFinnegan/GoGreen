class GreenspacesController < ApplicationController
  def home

  end

  def show
  end

  def index
      @greenspaces = Greenspace.all
  end
end
