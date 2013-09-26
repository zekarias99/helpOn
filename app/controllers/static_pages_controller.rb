class StaticPagesController < ApplicationController

  def home
    if signed_in?
      @micropost = current_user.microposts.build 
      @charity = current_user.charities.build 
      @feed_items = current_user.feed.paginate(page: params[:page])
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