class CharitiesController < ApplicationController

  def index
    @charities = Charity.all
  end

  def new
    @charity = Charity.new
  end

  def show
    @charity = Charity.find(params[:id])    
  end
  
  def edit
    @charity = Charity.find(params[:id])
  end
  
  def create
    @charity = Charity.new(charity_params)
    if @charity.save
      flash[:notice] = "Successfully created charity."
      redirect_to @charity
    else
      render  'new'
    end
  end
  
  
  def update
    @charity = Charity.find(params[:id])
    if @charity.update(charity_params)
      flash[:notice] = "Successfully updated charity."
      redirect_to charities_url
    else
      render  'edit'
    end
  end
  
  def destroy
    @charity = Charity.find(params[:id])
    @charity.destroy
    flash[:notice] = "Successfully removed charity."
    redirect_to charities_url
  end

  private

  def charity_params
    params.require(:charity).
    permit(:charity_name, :registered_charity_number, :first_name, 
           :last_name, :job_title, :email_address, :telephone_number,     
           :i_agree_to_the, :description,
           :address_1, :address_2, :state, :zip, :country,
           :website, :pick_a_category, :city_id )
  end
end

