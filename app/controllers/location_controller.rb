class LocationController < ApplicationController
  def index
    @image = Location.banner_selection(request.original_url)
    if @image
      @image.showed = @image.showed + 1
      @image.save
    end
  end

  def count
    image = Image.find(params[:id])
    image.clicked = image.clicked + 1
    image.save
    redirect_to root_path
  end
end
