class DealsController < ApplicationController

  def new
    @deal = Deal.new
  end

  def index 
    @deals = Deal.all
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

  private
   def deal_params 
    params.require(:deal).
    permit(:name, :blurb, :max_threshold, :max_discount, :deal_type, 
      :regular_price, :initial_discount, :tipping_point, :deal_date, :approved)
  end
end
