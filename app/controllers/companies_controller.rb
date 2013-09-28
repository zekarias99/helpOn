class CompaniesController < ApplicationController

   before_action :admin_user,     only: :destroy

  def index
    @companies = Company.all
  end

  def new
    @company = Company.new
  end

  def show
    @company = Company.find(params[:id])    
  end
  
  def edit
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
  
  
  def update
    @company = Company.find(params[:id])
    if @company.update(company_params)
      flash[:notice] = "Successfully updated company."
      redirect_to companies_url
    else
      render :action => 'edit'
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
    permit(:business_name, :email_address, :first_name, :last_name,
            :address_1, :address_2, :state, :zip,
            :country, :phone, :website, :pick_a_category,
            :where_do_you_want_your_helpon_to_run, :review_links,
            :tell_us_a_little_bit_about_your_business)
  end

  def admin_user
    redirect_to(root_url) unless current_user.admin?
  end
end
