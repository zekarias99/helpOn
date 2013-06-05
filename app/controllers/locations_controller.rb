class LocationsController < ApplicationController
  def index
    @locations = Location.all
  end

  def new
    @location = Location.new
  end

  def edit
    @location = Location.find(params[:id])
  end

  def show
    @location = Location.find(params[:id])
  end

  def create
    @location = Location.new(location_params)
    if@location.save
      flash[:notice] = "Successfully created location"
      redirect_to @location
    else
      render 'new'
    end
  end

  def update
    @location = Location.find(params[:id])
    if@location.update(location_params)
      flash[:notice] = "Successfully updated location"
      redirect_to locations_path
    else
      render 'edit'
    end
  end

  private

  def location_params
    params.require(:location).permit(:name, :zip_code)
  end
end
