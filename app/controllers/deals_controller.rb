class DealsController < ApplicationController

  def new
    @deal = Deal.new
  end

  def index
    @deals = Deal.order("deal_date desc").limit(10).includes(:city)
  end

  # def show
  #   @deal = Deal.find(params[:id])    
  # end

  
  def show
    if params[:city_name]
      city = City.where(:search_name => params[:city_name])
      @cities = City.includes(:state)
      
      if city.count == 0
        return render :city_request
      end
      
      today = Date.current.strftime("%Y-%m-%d").to_s
      weekend = 2.days.from_now.strftime("%Y-%m-%d").to_s
      
      @deal = Deal.where('city_id = ?', city).where('deal_date <= ? and end_date >= ?', today, today).where('approved = ?', true).includes(:city).last
      
      if @deal.nil?
        return render :coming_soon
      end
      
      @charity = Charity.where('city_id = ?', city).where('start_date <= ? and end_date >= ?', today, today).includes(:city).last
      @tweets = Twitter::Search.new('SugarSaveKnox').per_page(4)
    else
      redirect_to root_path
    end
  end
  
  def edit
    @deal = Deal.find(params[:id])
  end

  def create
    @deal = Deal.new(deal_params)
      if @deal.save
        flash[:notice] = "Deal has been created."
        redirect_to deals_path
      else
        render :new
    end
  end

  def update
    @deal = Deal.find(params[:id])
    if @deal.update(deal_params)
      flash[:notice] = "Deal successfully updated!"
      redirect_to deals_path
    else
      render :edit
    end
  end

  def destroy
    @deal = Deal.find(params[:id])
    @deal.destroy
    redirect_to deals_url, alert: 'Deal successfully deleted!'
  end

  private
   def deal_params 
    params.require(:deal).
    permit(:name, :blurb_title, :blurb, :deal_type, :photo, 
          :regular_price, :initial_discount, :max_discount, :max_threshold, 
          :tipping_point, :deal_date, :end_date, :approved)
  end
end
