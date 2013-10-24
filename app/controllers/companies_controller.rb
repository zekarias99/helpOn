class CompaniesController < ApplicationController

  before_action :admin_user,     only: [:index, :show, :destroy]


  def index
    @companies = Company.all
  end

  def new
    @company = Company.new
  end

  def show
    @company = Company.find(params[:id])    
  end
  
  
  def create
    @company = Company.new(company_params)
    if @company.save
      flash[:notice] = "Successfully created company."
      redirect_to @company
    else
      render :action => 'new'
    end
  end
  
  
  def destroy
    @company = Company.find(params[:id])
    @company.destroy
    flash[:notice] = "Successfully removed company."
    redirect_to companies_url
  end

  private

  def company_params
    params.require(:company).
    permit(:business_name, :address_1, :address_2, :state, :zip,
            :country, :phone, :website, :pick_a_category,
            :where_do_you_want_your_helpon_to_run, :review_links,
            :tell_us_a_little_bit_about_your_business)
  end
end
