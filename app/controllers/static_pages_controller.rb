class StaticPagesController < ApplicationController

  def home
    if signed_in?
      @charity    = current_user.charities.build 
      @micropost  = current_user.microposts.build 
      @feed_items = current_user.feed.paginate(page: params[:page])
    end
  end

  def help
  end

  def about    
  end

  def how_it_works 
    if signed_in?
    @charity = current_user.charities.build 
    end   
  end

  def contact  
  end
end