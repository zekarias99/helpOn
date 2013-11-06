class StoreController < ApplicationController

  include CurrentCart
  before_action :set_cart
  
  def index
  	@deals = Deal.order("deal_date desc").limit(10).includes(:city)
  end
end
