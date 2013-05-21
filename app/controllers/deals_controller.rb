class DealsController < ApplicationController

  def index 
    @deals = Deal.all
  end

  def show
    @deal = Deal.find(params[:id])    
  end

  def edit
    @deal = Deal.find(params[:id])
  end

  def update
    @deal = Deal.find(params[:id])
    deal_params = params.require(:deal).permit(:name, :blurb, :max_threshold,
      :deal_type, :regular_price, :initial_discount, :max_discount, 
      :tipping_point, :deal_date, :approved)
    @deal.update(deal_params)
    redirect_to @deal
  end
end