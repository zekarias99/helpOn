class CitiesController < ApplicationController
  def index
    @cities = City.includes(:state)
  end

  def edit
    @city = City.find(params[:id])
  end

  def show
    @city = City.find(params[:id])
  end

  def new
    @city = City.new
  end
  
  def create
    @city = City.new(city_params)
    if @city.save
      flash[:notice] = "Successfully created city."
      redirect_to cities_path
    else
      render  'new'
    end
  end
  
  def update
    @city = City.find(params[:id])
    if @city.update(city_params)
      flash[:notice] = "Successfully updated city."
      redirect_to cities_path
    else
      render 'edit'
    end
  end
  
  def destroy
    @city = City.find(params[:id])
    @city.destroy
    flash[:notice] = "Successfully removed city."
    redirect_to cities_url
  end

  private

  def city_params
    params.require(:city).
    permit(:name, :abbreviation)
  end

end
