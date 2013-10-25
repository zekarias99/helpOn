class CharitiesController < ApplicationController
  before_action :signed_in_user
  before_action :correct_user,   only: :destroy

  def index
    @charities = current_user.charities
  end

  def new
    @charity = current_user.charities.build 
  end

  def edit
   @user = current_user
   @charity = @user.charities.find_by(params[:id])
  end
  
  def create
    @charity = current_user.charities.build(charity_params)
    if @charity.save
      flash[:success] = "Charity created"
      redirect_to root_url
    else
      @feed_items = current_user.feed.paginate(page: params[:page])
       render 'static_pages/home' 
    end   
  end

  def update
    @charity = Charity.find(params[:id])
    if @charity.update(charity_params)
      flash[:notice] = "Successfully updated charity."
      redirect_to current_user
    else
      render  'edit'
    end
  end

  def destroy
    @charity.destroy
    redirect_to root_url
  end

  # def index
  #   @charities = Charity.all
  # end

  # def new
  #   @charity = Charity.new
  # end

  # def show
  #   @charity = Charity.find(params[:id])    
  # end
  
  # def edit
  #   @charity = Charity.find(params[:id])
  # end
  
  # def create
  #   @charity = Charity.new(charity_params)
  #   if @charity.save
  #     flash[:notice] = "Successfully created charity."
  #     redirect_to @charity
  #   else
  #     render  'new'
  #   end
  # end
  
  
  # def destroy
  #   @charity = Charity.find(params[:id])
  #   @charity.destroy
  #   flash[:notice] = "Successfully removed charity."
  #   redirect_to charities_url
  # end

  private

  def charity_params
    params.require(:charity).
    permit(:charity_name, :registered_charity_number, :i_agree_to_the,     
           :description, :zip, :country, :address_1, :address_2, :goal_amount,
           :state, :city, :raising_ends_on, :website, :pick_a_category,)
            
  end

    def correct_user
    @charity = current_user.charities.find_by(id: params[:id])
    redirect_to root_url if @charity.nil?
  end
end

