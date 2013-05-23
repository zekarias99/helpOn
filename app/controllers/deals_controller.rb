class DealsController < ApplicationController

  def new
    @deal = Deal.new
  end

  def index 
    @deals = Deal.featured_date
  end

  def show
    @deal = Deal.find(params[:id])    
  end

  def edit
    @deal = Deal.find(params[:id])
  end

  def create
    @deal = Deal.new(deal_params)
    @deal.save
    redirect_to @deal
  end

  def update
    @deal = Deal.find(params[:id])
    @deal.update(deal_params)
    redirect_to @deal
  end

  def destroy
    @deal = Deal.find(params[:id])
    @deal.destroy
    redirect_to root_path
  end

  private
   def deal_params 
    params.require(:deal).
    permit(:name, :blurb, :max_threshold, :max_discount, :deal_type, 
      :regular_price, :initial_discount, :tipping_point, :deal_date, :approved)
  end
end
