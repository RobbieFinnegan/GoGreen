class PagesController < ApplicationController
  def home
    @footer_variable = true
  end

  def park
  end

  def second_page
    if params[:query].present?
      @greenspaces = Greenspace.where(name: params[:query])
    else
      @greenspaces = Greenspace.all
    end
  end
end
