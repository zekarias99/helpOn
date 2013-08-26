class StaticPagesController < ApplicationController

  def home
    if signed_in?
      @status = current_user.statuses.build
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