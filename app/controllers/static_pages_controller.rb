class StaticPagesController < ApplicationController
  include CurrentCart
  before_action :set_cart

  def home

    if signed_in?
      @micropost  = current_user.microposts.build 
      @feed_items = current_user.feed.paginate(page: params[:page])
    else
      redirect_to store_path
    end
  end

  def help
  end

  def about    
  end

  def how_it_works 
  end

  def contact  
  end
end